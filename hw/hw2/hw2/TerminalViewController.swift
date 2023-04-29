//
//  TerminalViewController.swift
//  hw2
//
//  Created by Blake Boris on 4/28/23.
//

import UIKit

class TerminalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let apiKey = "581954360bb24ae0bc667769dd6cad45";
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    var timestamp: String?;
    var errorCode: String?;
    var errorNumber: String?;
    var dataAvailable = false
    var trains: [Train] = []
    
    //These gets passed in from main vc
    public var terminal: Terminal = Terminal.howardRedPurpleYellowlines;
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tableViewTrains: UITableView!
    
    var dataError = "";
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        lblName.text = terminal.fullName
        
        getTerminalInfo(terminalID: terminal.id);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (trains.isEmpty) ? 1 : trains.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (trains.isEmpty == false) {
            let cell = tableViewTrains.dequeueReusableCell(withIdentifier: "train", for: indexPath) as! TrainTableViewCell;
            let train = trains[indexPath.row];
            
            cell.train = train;
            
            cell.lblDestination.text = train.destinationString;
            
            if (train.isApproaching == "1") {
                cell.lblMinsOrDue.text = "Due";
                cell.lblStaticMinutes.isHidden = true;
            }
            else {
                print("yo the time this prediction was made is: " + (train.timeOfPrediction ?? "idk"));
                print("yo the time this train is predicted to arrive is: " + (train.predictedArrivalTime ?? "idk"));
                print();
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                
                guard let time1 = dateFormatter.date(from: train.timeOfPrediction!),
                      let time2 = dateFormatter.date(from: train.predictedArrivalTime!) else {
                    fatalError("Invalid date format")
                }
                
                let diffSeconds = time2.timeIntervalSince(time1)
                let diffMinutes = diffSeconds / 60
                
                cell.lblMinsOrDue.text = String(format: "%.0f", diffMinutes);
                cell.lblStaticMinutes.isHidden = false;
            }
            
            return cell;
        }
        
        let cell = tableViewTrains.dequeueReusableCell(withIdentifier: "error", for: indexPath) as! ErrorTableViewCell;
        cell.lblError.text = (self.dataError == "") ? "No trains to show" : self.dataError;
        return cell;
    }
    
    func getTerminalInfo(terminalID: Int) {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=\(apiKey)&mapid=\(terminalID)&outputType=JSON") else {
            fatalError("Invalid URL");
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard (error == nil) else {
                self.dataError = error!.localizedDescription;
                DispatchQueue.main.async{
                    self.tableViewTrains.reloadData();
                }
                return;
            }
            guard let data = data else {
                self.dataError = "Error fetching JSON Object :(";
                DispatchQueue.main.async{
                    self.tableViewTrains.reloadData();
                }
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
                            let eta = try JSONSerialization.data(withJSONObject: eta, options: [])
                            let train = try decoder.decode(Train.self, from: eta);
                            self.trains.append(train);
                        }
                        catch SerializationError.missing(let msg) {
                            print("Missing \(msg)");
                        }
                        catch SerializationError.invalid(let msg, let data) {
                            print("Invalid \(msg): \(data)");
                        }
                        catch let error as NSError {
                            print(error.localizedDescription);
                        }
                    }
                    
                    self.dataAvailable = true;
                    
                    DispatchQueue.main.async{
                        self.tableViewTrains.reloadData();
                    }
                }
            } catch SerializationError.invalid(let msg, let data) {
                self.dataError = "Invalid \(msg): \(data) :(";
                DispatchQueue.main.async{
                    self.tableViewTrains.reloadData();
                }
            } catch let error as NSError {
                self.dataError = error.localizedDescription;
                DispatchQueue.main.async{
                    self.tableViewTrains.reloadData();
                }
            }
        }.resume();
    }
}
