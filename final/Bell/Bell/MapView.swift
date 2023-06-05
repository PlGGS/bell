//
//  MapView.swift
//  Bell
//
//  Created by Blake Boris on 6/4/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var isCenterCloseToUserLocation: Bool
    
    let view = MKMapView()
    let lines: [Line] = Line.allCases
    
    func makeUIView(context: Context) -> MKMapView {
        view.delegate = context.coordinator
        view.region = MKCoordinateRegion()
        view.showsUserLocation = true
        view.userTrackingMode = .follow
        addTransitLines(lines)
        return view
    }

    func updateUIView(_ view: MKMapView, context: Context) {}

    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self)
    }
    
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
        print("latitudeDifference \(latitudeDifference)")
        
        let longitudeDifference = abs(view.region.center.longitude - userLocation.longitude)
        print("longitudeDifference \(longitudeDifference)")
        
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
        view.removeAnnotations(view.annotations)
        view.addAnnotation(annotation)
    }
    
    func recenterDotAnnotation(_ userCoordinate: CLLocationCoordinate2D) {
        placeDotAnnotation(userCoordinate)
    }
}
