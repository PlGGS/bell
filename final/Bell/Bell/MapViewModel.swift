//
//  MapViewModel.swift
//  Bell
//
//  Created by Blake Boris on 6/5/23.
//

import SwiftUI
import MapKit

class MapViewModel: ObservableObject {
    @Published var view = MKMapView()
    @Published var location: Location = Location()
    
    @Published var isCenterCloseToUserLocation: Bool = false
    
    @Published var userPinAnnotation: MKAnnotation = MKPointAnnotation()
    @Published var trainAnnotations: [TrainAnnotation] = []
    
    @Published var isSelectingTerminal: Bool = true
    @Published var selectedTerminal: Terminal? = nil
    @Published var userPinLocationWhenTerminalSelected: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    var lineOverlays: [MKPolyline] = []

    func removeTransitLines() {
        view.removeOverlays(lineOverlays)
        lineOverlays = []
    }
    
    func drawTransitLines(_ lines: [Line]) {
        //we always want to remove lines before adding new ones
        removeTransitLines()
        
        for line in lines {
            var coordinates: [CLLocationCoordinate2D] = []
            
            for stop in line.stops {
                coordinates.append(CLLocationCoordinate2D(latitude: stop.latitude, longitude: stop.longitude))
            }
            
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            polyline.title = line.shortName
            
            lineOverlays.append(polyline)
            view.addOverlay(polyline)
        }
    }
    
    func isCenterCloseToUserLocation(_ userLocation: CLLocationCoordinate2D) -> Bool {
        let tolerance: Double = 0.0001

        let latitudeDifference = abs(view.region.center.latitude - userLocation.latitude)
        let longitudeDifference = abs(view.region.center.longitude - userLocation.longitude)
        
        let out = (latitudeDifference <= tolerance && longitudeDifference <= tolerance)
        
        return out
    }
    
    func updateRegion(_ centerCoordinate: CLLocationCoordinate2D) {
//        print("selectedTerminal: \(selectedTerminal)")
//        print("isSelectingTerminal \(isSelectingTerminal)")
//        print("nearby terminals: \(RadialRegion(latitude: view.region.center.latitude, longitude: view.region.center.longitude, radiusInMiles: 0.25).getTerminals())")
//        print()
        
        view.region.center = centerCoordinate
//        print("center: \(view.region.center)")
        
        updatePrevUserPinLocation()
        
        if let locationManager = location.manager {
            if let location = locationManager.location  {
                isCenterCloseToUserLocation = isCenterCloseToUserLocation(location.coordinate)
            }
        }
    }
    
    func updatePrevUserPinLocation() {
        if selectedTerminal == nil {
            userPinLocationWhenTerminalSelected = view.region.center
        }
        else {
            //user has backed out of a selected terminal
            if isSelectingTerminal {
                selectedTerminal = nil
                userPinLocationWhenTerminalSelected = view.region.center
            }
        }
    }
    
    func recenterMap() {
        if let userLocation = view.userLocation.location {
            let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
            view.region = MKCoordinateRegion(center: center, span: view.region.span)
        }
    }
    
    func placeDotAnnotation(_ centerCoordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = centerCoordinate
        
        view.removeAnnotation(userPinAnnotation)
        view.addAnnotation(annotation)
        
        userPinAnnotation = annotation
    }
    
    func removeTrainAnnotations() {
        for annotation in trainAnnotations {
            view.removeAnnotation(annotation)
        }
        
        trainAnnotations = []
    }
    
    func placeTrainAnnotation(train: Train) {
        let latitude = Double(train.latitude ?? "0.0")!
        let longitude = Double(train.longitude ?? "0.0")!
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = TrainAnnotation(coordinate: coordinate, lineName: Line(rawValue: train.lineName!)!.shortName, runNumber: train.runNumber ?? "???")
        
        trainAnnotations.append(annotation)
        view.addAnnotation(annotation)
    }
    
    func recenterDotAnnotation() {
        if let locationManager = location.manager {
            if let location = locationManager.location {
//                print("\(view.region.center.latitude) \(location.coordinate.longitude)")
//                print("\(view.region.center.latitude) \(location.coordinate.longitude)")
//                print()
                
                placeDotAnnotation(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
            }
        }
    }
}
