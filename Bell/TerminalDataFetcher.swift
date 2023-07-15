//
//  TerminalRequestData.swift
//  Bell
//
//  Created by Blake Boris on 5/19/23.
//

import Foundation

class TerminalDataFetcher: ObservableObject {
    let apiKey = "581954360bb24ae0bc667769dd6cad45";
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    public var timestamp: String?;
    public var errorCode: String?;
    public var errorNumber: String?;
    public var dataError: String?;
    @Published var trains: [Train] = [];
    
    ///Fetches JSON data for each upcoming train at a specified parent terminal by ID
    func getTerminalInfo(terminalID: Int) async -> String? {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=\(apiKey)&mapid=\(terminalID)&outputType=JSON") else {
            fatalError("Invalid URL");
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard (error == nil) else {
                self.dataError = error!.localizedDescription;
                return;
            }
            guard let data = data else {
                self.dataError = "Error fetching JSON Object :(";
                return;
            }
            
            do {
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    guard let ctatt = json["ctatt"] as? [String:Any] else {
                        throw SerializationError.missing("ctatt")
                    }
                    self.timestamp = ctatt["tmst"] as? String;
                    self.errorCode = ctatt["errCd"] as? String;
                    self.errorNumber = ctatt["errNm"] as? String
                    
                    guard let etas = ctatt["eta"] as? [Any] else {
                        return; //There are no trains to show I guess
                    }
                    
                    let decoder = JSONDecoder();
                    for eta in etas {
                        do {
                            let etaData = try JSONSerialization.data(withJSONObject: eta, options: [])
                            let train = try decoder.decode(Train.self, from: etaData);
                            
                            DispatchQueue.main.async {
                                self.trains.append(train);
//                                print("This ETA is all good: \(eta)");
                            }
                        }
                        catch SerializationError.missing(let msg) {
                            print("Missing \(msg)");
                        }
                        catch SerializationError.invalid(let msg, let data) {
                            print("Invalid \(msg): \(data)");
                        }
                        catch let error as NSError {
                            print("ETA Missing: \"\(error.localizedDescription)\" \(eta)");
                        }
                    }
                }
            } catch SerializationError.invalid(let msg, let data) {
                self.dataError = "Invalid \(msg): \(data) :(";
            } catch let error as NSError {
                self.dataError = error.localizedDescription;
            }
        }.resume();
        
        return self.dataError
    }
}
