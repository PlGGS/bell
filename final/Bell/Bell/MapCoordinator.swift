//
//  MapCoordinator.swift
//  Bell
//
//  Created by Blake Boris on 6/2/23.
//

import SwiftUI
import MapKit

class MapCoordinator: NSObject, MKMapViewDelegate {
    var parent: any UIViewRepresentable

    init(_ parent: any UIViewRepresentable) {
        self.parent = parent
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor(Color(routePolyline.title ?? "Black"))
            renderer.lineWidth = 3
            return renderer
        }
        
        return MKOverlayRenderer()
    }
}
