//
//  RadialRegion.swift
//  Bell
//
//  Created by Blake Boris on 6/2/23.
//

import MapKit

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180.0
    }
}

class RadialRegion: ObservableObject {
    let centerCoordinates: CLLocation
    let radius: Double //Miles
    
    let metersToMilesConversionFactor: Double = 0.00062137119
    
    init(latitude: Double, longitude: Double, radiusInMiles: Double) {
        self.centerCoordinates = CLLocation(latitude: latitude, longitude: longitude)
        self.radius = radiusInMiles
    }
    
    func getTerminals() -> [Terminal] {
        return Terminal.allCases.filter { containsTerminal($0) }
    }
    
    func containsTerminal(_ terminal: Terminal) -> Bool {
        let distanceInMeters = centerCoordinates.distance(from: CLLocation(latitude: terminal.latitude, longitude: terminal.longitude))
        let distanceInMiles = distanceInMeters * metersToMilesConversionFactor
        return distanceInMiles <= radius
    }
}
