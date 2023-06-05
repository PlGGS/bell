//
//  LocationManager.swift
//  Bell
//
//  Created by Blake Boris on 6/2/23.
//

import SwiftUI
import MapKit

class Location: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.92323320, longitude: -87.65379270), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var manager: CLLocationManager?
    
    override init() {
        super.init()
        
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager!.delegate = self
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = manager else { return }

        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                Alert(
                    title: Text("Location Services Restricted"),
                    message: Text("Location Services are restricted. This is most likely due to parental controls."),
                    primaryButton: .default(Text("Settings"), action: openSettings),
                    secondaryButton: .cancel()
                )
            case .denied:
                Alert(
                    title: Text("Location Services Denied"),
                    message: Text("Location Services were previously denied. Please enable Location Services in Settings."),
                    primaryButton: .default(Text("Settings"), action: openSettings),
                    secondaryButton: .cancel()
                )
            case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: region.span)
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
    }
}
