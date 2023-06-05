//
//  TrainAnnotation.swift
//  Bell
//
//  Created by Blake Boris on 6/4/23.
//

import MapKit

class TrainAnnotation: NSObject, MKAnnotation {
    //https://stackoverflow.com/questions/2256177/how-to-move-a-mkannotation-without-adding-removing-it-from-the-map
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var title: String?
    var lineName: String
    var runNumber: String
    var nextParentTerminalID: Int
    
    //step size for interpolating to destinationTerminal
    let stepSize: Double = 0.001
    
    let annotationQueue = DispatchQueue(label: "com.example.annotationQueue")
    
    init(coordinate: CLLocationCoordinate2D, lineName: String, runNumber: String, nextParentTerminalID: String) {
        self.coordinate = coordinate
        self.lineName = lineName
        self.runNumber = runNumber
//        self.title = "#\(runNumber)"
        
        //force unwrapping, because every train should have a nextParentTerminalID
        self.nextParentTerminalID = Int(nextParentTerminalID)!
        super.init()
        self.title = "Next: \(nextTerminal()!.shortName)"
    }
    
    func nextTerminal() -> Terminal? {
        return Terminal(rawValue: nextParentTerminalID)
    }
    
    func getVector(towards: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: towards.latitude - coordinate.latitude,
            longitude: towards.longitude - coordinate.longitude
        )
    }
    
    func moveCoordinate(towards: CLLocationCoordinate2D) {
        let vector = getVector(towards: towards)
        
        let newCoordinate = CLLocationCoordinate2D(
            latitude: coordinate.latitude + vector.latitude * stepSize,
            longitude: coordinate.longitude + vector.longitude * stepSize
        )
        
        coordinate = newCoordinate
    }
}
