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
                    self.parent.mapViewModel.updateRegion(centerCoordinate)
                    
                    if self.parent.mapViewModel.selectedTerminal == nil {
                        self.parent.mapViewModel.placeDotAnnotation(centerCoordinate)
                    }
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        if annotation is TrainAnnotation {
            if let trainAnnotation = annotation as? TrainAnnotation {
                let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "train")
                
//                print("Customizing annotation for \(trainAnnotation.lineName) line run #\(trainAnnotation.runNumber)")
                
                let color = UIColor(Color(trainAnnotation.lineName))
                annotationView.markerTintColor = UIColor(Color(color))
                if let systemImage = UIImage(systemName: "train.side.rear.car") {
                    let flippedImage = UIImage(cgImage: systemImage.cgImage!, scale: systemImage.scale, orientation: .upMirrored)
                    annotationView.glyphImage = flippedImage
                }
                
                return annotationView
            }
        }

        return nil
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor(Color(routePolyline.title ?? "Black"))
            renderer.lineWidth = 4
            
            if parent.mapViewModel.selectedTerminal != nil && parent.mapViewModel.isSelectingTerminal == false {
                renderer.lineWidth = 7
            }
            
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
}
