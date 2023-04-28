//
//  ViewController.swift
//  hw2
//
//  Created by Blake Boris on 4/25/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let apiKey = "581954360bb24ae0bc667769dd6cad45"
    
    @IBOutlet weak var collectionViewLines: UICollectionView!
    
    var selectedLineIndex = [-1];
    
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
        
//        collectionViewLines.collectionViewLayout.invalidateLayout();
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        collectionViewLines.collectionViewLayout = layout
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
