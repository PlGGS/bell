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
    let lines: [Line] = Line.allCases
    
    var isCenterCloseToUserLocation: Bool = false
    var userPinLatitude: Double = 0.0
    var userPinLongitude: Double = 0.0
    
    var userPinAnnotation: MKAnnotation = MKPointAnnotation()
    var trainAnnotations: [MKAnnotation] = []

    func addTransitLines(_ lines: [Line]) {
        for line in lines {
            var coordinates: [CLLocationCoordinate2D] = []
            
            for stop in line.stops {
                coordinates.append(CLLocationCoordinate2D(latitude: stop.latitude, longitude: stop.longitude))
            }
            
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            polyline.title = line.shortName
            view.addOverlay(polyline)
        }
    }
    
    func isCenterCloseToUserLocation(_ userLocation: CLLocationCoordinate2D) -> Bool {
        let tolerance: Double = 0.01

        let latitudeDifference = abs(view.region.center.latitude - userLocation.latitude)
        let longitudeDifference = abs(view.region.center.longitude - userLocation.longitude)
        
        let out = (latitudeDifference <= tolerance && longitudeDifference <= tolerance)
        
        isCenterCloseToUserLocation = out
        return out
    }
    
    func updateRegion(_ centerCoordinate: CLLocationCoordinate2D) {
        view.region.center = centerCoordinate
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
    }
    
    func placeTrainAnnotation(train: Train) {
        let latitude = Double(train.latitude ?? "0.0")!
        let longitude = Double(train.longitude ?? "0.0")!
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = TrainAnnotation(coordinate: coordinate, lineName: Line(rawValue: train.lineName!)!.shortName, runNumber: train.runNumber ?? "???")
        
        view.addAnnotation(annotation)
    }
    
    func recenterDotAnnotation(_ userCoordinate: CLLocationCoordinate2D) {
        placeDotAnnotation(userCoordinate)
    }
}
