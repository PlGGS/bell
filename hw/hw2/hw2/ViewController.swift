//
//  ViewController.swift
//  hw2
//
//  Created by Blake Boris on 4/25/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let apiKey = "581954360bb24ae0bc667769dd6cad45"
    
    @IBOutlet weak var collectionViewLines: UICollectionView!
    @IBOutlet weak var tableViewLines: UITableView!
    
    var selectedLineIndex = [-1];
    var filteredTerminals = [Terminal]()
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    var timestamp: String?;
    var errorCode: String?;
    var errorNumber: String?;
    var dataAvailable = false
    var trains: [Train] = []

    override func viewDidLoad() {
        super.viewDidLoad();
        
//        getTerminalInfo(terminalID: Terminal.belmontRedBrownPurplelines.id);
//        getLineInfo(line: "red");
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        collectionViewLines.collectionViewLayout = layout
        
        filteredTerminals = Terminal.allCases;
        
        tableViewLines.delegate = self;
        tableViewLines.dataSource = self;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Line.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewLines.dequeueReusableCell(withReuseIdentifier: "mscvc", for: indexPath) as! MultipleSelectionCollectionViewCell;
        
        cell.lblSelection.text = Line.allCases[indexPath.row].fullName;
        
        if selectedLineIndex.contains(indexPath.item) {
            if (Line.allCases[indexPath.row].shortName == "PurpleExp") {
                cell.selectionView.backgroundColor = UIColor(named: "Purple");
            }
            else {
                cell.selectionView.backgroundColor = UIColor(named: Line.allCases[indexPath.row].shortName)
            }
            
            cell.lblSelection.textColor = UIColor.white;
        }
        else {
            cell.selectionView.backgroundColor = UIColor.white;
            cell.lblSelection.textColor = UIColor.darkGray;
        }
        
        cell.lblSelection.sizeToFit();
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selectedLineIndex.contains(indexPath.item)) {
            if let index = selectedLineIndex.firstIndex(of: indexPath.item) {
                selectedLineIndex.remove(at: index);
            }
        }
        else {
            selectedLineIndex.append(indexPath.item);
        }
        
        collectionViewLines.reloadData();
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionViewLines.dequeueReusableCell(withReuseIdentifier: "mscvc", for: indexPath) as! MultipleSelectionCollectionViewCell;
        
        cell.lblSelection.text = Line.allCases[indexPath.row].fullName;
        cell.lblSelection.sizeToFit();
        let size = cell.lblSelection.frame.size;
        
        return CGSize(width: size.width + 20, height: size.height + 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != "") {
            filteredTerminals = Terminal.allCases.filter({$0.fullName.contains(searchText)})
        }
        else {
            filteredTerminals = Terminal.allCases;
        }
        
        tableViewLines.reloadData();
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let terminalvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "terminalvc") as! TerminalViewController;
        
        terminalvc.terminal = filteredTerminals[tableViewLines.indexPathForSelectedRow!.row];

        terminalvc.modalPresentationStyle = .popover;
        self.present(terminalvc, animated: true);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTerminals.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewLines.dequeueReusableCell(withIdentifier: "terminal", for: indexPath) as! TerminalTableViewCell;
        
        let terminal = filteredTerminals[indexPath.row];
        
        cell.lblName.text = terminal.shortName;
        if (terminal.lines.count > 2) {
            cell.lblLines.text = terminal.lines.dropLast().joined(separator: ", ") + ", and " + terminal.lines.last! + " lines";
        }
        else if (terminal.lines.count == 2) {
            cell.lblLines.text = terminal.lines[0] + " and " + terminal.lines[1] + " lines";
        }
        else {
            cell.lblLines.text = terminal.lines[0];
        }
        cell.lblLines.text?.replace("PurpleExp", with: "Purple (Express)")
        
        cell.imgIsADAComplient.isHidden = (terminal.isADAComplient) ? false : true;
        
        return cell;
    }
    
    func getTerminalInfo(terminalID: Int) {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=\(apiKey)&mapid=\(terminalID)&outputType=JSON") else {
            fatalError("Invalid URL");
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard (error == nil) else {
                print(error!);
                return;
            }
            guard let data = data else {
                print("Data is empty");
                return;
            }
            
            do {
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
//                    print(json)
                    
                    guard let ctatt = json["ctatt"] as? [String:Any] else {
                        throw SerializationError.missing("ctatt")
                    }
                    self.timestamp = ctatt["tmst"] as? String;
                    self.errorCode = ctatt["errCd"] as? String;
                    self.errorNumber = ctatt["errNm"] as? String
                    
                    guard let etas = ctatt["eta"] as? [Any] else {
                        throw SerializationError.missing("eta")
                    }
                    
                    let decoder = JSONDecoder();
                    for eta in etas {
                        do {
//                            print(eta);
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
                        for train in self.trains {
                            print(train.runNumber);
                        }
                    }
                }
            } catch SerializationError.missing(let msg) {
                print("Missing \(msg)");
            } catch SerializationError.invalid(let msg, let data) {
                print("Invalid \(msg): \(data)");
            } catch let error as NSError {
                print(error.localizedDescription);
            }
        }.resume();
    }
    
    func getLineInfo(line: String) {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttpositions.aspx?key=\(apiKey)&rt=\(line)&outputType=JSON") else {
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard (error == nil) else {
                print(error!);
                return
            }
            guard let data = data else {
                print("Data is empty");
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // Process the JSON data
                    print(json);
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)");
            }
        }.resume();
    }
}
