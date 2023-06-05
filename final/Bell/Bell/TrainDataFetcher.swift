//
//  TrainDataFetcher.swift
//  Bell
//
//  Created by Blake Boris on 6/5/23.
//

import Foundation

class TrainDataFetcher: ObservableObject {
    let apiKey = "581954360bb24ae0bc667769dd6cad45";
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    public var dataError: String?;
    
    ///Fetches JSON data for each upcoming terminal in a given train's route by runNumber
    func getTrainEtas(train: Train) async -> [Train]? {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttfollow.aspx?key=\(apiKey)&runnumber=\(train.runNumber ?? "???")&outputType=JSON") else {
            fatalError("Invalid URL")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            guard let ctatt = json?["ctatt"] as? [String: Any] else {
                throw SerializationError.missing("ctatt")
            }
            
            guard let etas = ctatt["eta"] as? [[String: Any]] else {
                return [] // There are no upcoming terminals
            }
            
            let decoder = JSONDecoder()
            let trainEtas = try etas.map { etaData -> Train in
                let eta = try decoder.decode(Train.self, from: JSONSerialization.data(withJSONObject: etaData))
                return eta
            }
            
            return trainEtas
        } catch {
            self.dataError = error.localizedDescription
            return []
        }
    }
}
