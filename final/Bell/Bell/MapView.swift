//
//  MapView.swift
//  Bell
//
//  Created by Blake Boris on 6/4/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @EnvironmentObject var mapViewModel: MapViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        mapViewModel.view.delegate = context.coordinator
        mapViewModel.view.region = MKCoordinateRegion()
        mapViewModel.view.showsUserLocation = true
        mapViewModel.view.userTrackingMode = .follow
        mapViewModel.addTransitLines(mapViewModel.lines)
        return mapViewModel.view
    }

    func updateUIView(_ view: MKMapView, context: Context) {}

    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(self)
    }
}
