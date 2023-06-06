//
//  TrainDataFetcher.swift
//  Bell
//
//  Created by Blake Boris on 6/5/23.
//

import Foundation
import CoreLocation

class TrainDataFetcher: ObservableObject {
    let apiKey = "581954360bb24ae0bc667769dd6cad45";
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    func getVector(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: to.latitude - from.latitude,
            longitude: to.longitude - from.longitude
        )
    }
    
    func secondClosestTerminalIsCorrect(initial: CLLocationCoordinate2D, destination1: CLLocationCoordinate2D, destination2: CLLocationCoordinate2D, target: CLLocationCoordinate2D) -> Bool {
        let vector1 = getVector(from: initial, to: destination1)
        print("vector1: \(vector1)")
        let vector2 = getVector(from: initial, to: destination2)
        print("vector2: \(vector2)")
        let targetVector = getVector(from: initial, to: target)
        
        let dotProduct1 = vector1.latitude * targetVector.latitude + vector1.longitude * targetVector.longitude
        let dotProduct2 = vector2.latitude * targetVector.latitude + vector2.longitude * targetVector.longitude
        
        if dotProduct2 < dotProduct1 {
            //destination2 is more in line with the target location
            return true
        }
        
        //otherwise if <=, destination1 is more in line with the target location
        return false
    }
    
    public var dataError: String?;
    
    ///Fetches JSON data for each upcoming terminal in a given train's route by runNumber
    func getClosestTerminal(train: Train) async -> Train? {
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
                return nil // There are no upcoming terminals
            }
            
            let decoder = JSONDecoder()
            
            let closestEta = try decoder.decode(Train.self, from: JSONSerialization.data(withJSONObject: etas[0]))
            
            ///Hello. Welcome to Hell.
            ///
            ///PLEASE FEEL FREE TO UNCOMMENT THIS MESS AND TRY TO DEBUG SOME TRAINS RETURNING THE WRONG LOCATION FROM THE API
            ///AND SOME TRAIN ANNOTATIONS GOING THE WRONG WAY ON THE MAP
            ///IT. MAKES. NO. SENSE.
            
//            let closestEtaNextTerminal = Terminal(rawValue: Int(closestEta.nextParentTerminalID ?? "?????") ?? 0)
//            let closestEtaLocation = CLLocationCoordinate2D(latitude: Double(closestEtaNextTerminal!.latitude), longitude: Double(closestEtaNextTerminal!.longitude))
//
//            var secondClosestEta: Train? = nil
//            var secondClosestEtaNextTerminal: Terminal?
//            var secondClosestEtaLocation: CLLocationCoordinate2D? = nil
//            if etas.count > 1 {
//                secondClosestEta = try decoder.decode(Train.self, from: JSONSerialization.data(withJSONObject: etas[1]))
//                secondClosestEtaNextTerminal = Terminal(rawValue: Int(secondClosestEta!.nextParentTerminalID ?? "?????") ?? 0)
//                secondClosestEtaLocation = CLLocationCoordinate2D(latitude: Double(secondClosestEtaNextTerminal!.latitude), longitude: Double(secondClosestEtaNextTerminal!.longitude))
//            }
//            else {
//                return closestEta
//            }
//
//            let closestId = Int(closestEta.nextParentTerminalID ?? "?????") ?? 0
//            print("\(closestEta.lineName!) line run #\(closestEta.runNumber!) is heading \(closestEta.getDirection()) and is \(closestEta.secondsTillArrival()) seconds away from \(Terminal(rawValue: closestId) ?? Terminal.sixtyNinthRedLine) | \(closestEtaLocation.latitude), \(closestEtaLocation.longitude)")
//
//            let secondClosestId = Int(secondClosestEta!.nextParentTerminalID ?? "?????") ?? 0
//            print("\(secondClosestEta!.lineName!) line run #\(secondClosestEta!.runNumber!) is heading \(secondClosestEta!.getDirection()) and is \(secondClosestEta!.secondsTillArrival()) seconds away from \(Terminal(rawValue: secondClosestId) ?? Terminal.sixtyNinthRedLine) | \(secondClosestEtaLocation!.latitude), \(secondClosestEtaLocation!.longitude)")
//
//            let trainLocation = CLLocationCoordinate2D(latitude: Double(train.latitude ?? "0.0") ?? 0.0, longitude: Double(train.longitude ?? "0.0") ?? 0.0)
//
//            let userSelectedTerminal = Terminal(rawValue: Int(train.nextParentTerminalID ?? "?????") ?? 0)
//            let userSelectedTerminalLocation = CLLocationCoordinate2D(latitude: Double(userSelectedTerminal!.latitude), longitude: Double(userSelectedTerminal!.longitude))
//
//            if secondClosestTerminalIsCorrect(initial: trainLocation, destination1: closestEtaLocation, destination2: secondClosestEtaLocation!, target: userSelectedTerminalLocation) {
//                print("Selected second closest: \(secondClosestEta!.nextParentTerminalShortName!)")
//                return secondClosestEta
//            }
//
//            print("Selected closest: \(closestEta.nextParentTerminalShortName!)")
            return closestEta
        } catch {
            self.dataError = error.localizedDescription
            return nil
        }
    }
}
