//
//  MapCoordinator.swift
//  Bell
//
//  Created by Blake Boris on 6/2/23.
//

import SwiftUI
import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate, ObservableObject {
    var parent: MapView
    
    private var regionUpdateQueue = DispatchQueue(label: "com.blakeboris.Bell.regionUpdateQueue")

    init(_ parent: MapView) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        regionUpdateQueue.async {
            DispatchQueue.main.async {
                if let centerCoordinate = mapView.centerCoordinate as Optional {
                    self.parent.updateRegion(centerCoordinate)
                    self.parent.placeDotAnnotation(centerCoordinate)
                    self.parent.isCenterCloseToUserLocation(centerCoordinate)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor(Color(routePolyline.title ?? "Black"))
            renderer.lineWidth = 3
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}
