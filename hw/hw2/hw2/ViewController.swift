//
//  ViewController.swift
//  hw2
//
//  Created by Blake Boris on 4/25/23.
//

import UIKit

class ViewController: UIViewController {
    let apiKey = "581954360bb24ae0bc667769dd6cad45"

    override func viewDidLoad() {
        super.viewDidLoad();
        
        getTerminalInfo(terminal: "40380");
//        getLineInfo(line: "red");
    }

    func getTerminalInfo(terminal: String) {
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=\(apiKey)&mapid=\(terminal)&outputType=JSON") else {
            fatalError("Invalid URL");
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

