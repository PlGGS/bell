//
//  TrainAnnotation.swift
//  Bell
//
//  Created by Blake Boris on 6/4/23.
//

import MapKit

class TrainAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    var title: String?
    var lineName: String
    var runNumber: String
    
    init(coordinate: CLLocationCoordinate2D, lineName: String, runNumber: String) {
        self.coordinate = coordinate
        self.lineName = lineName
        self.runNumber = runNumber
        self.title = "#\(runNumber)"
    }
}
