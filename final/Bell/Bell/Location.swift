//
//  LocationManager.swift
//  Bell
//
//  Created by Blake Boris on 6/2/23.
//

import SwiftUI
import CoreLocation

class Location: NSObject, ObservableObject, CLLocationManagerDelegate {
    var manager: CLLocationManager?
    
    override init() {
        super.init()
        
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager!.delegate = self
        }
    }
    
    private  func checkLocationAuthorization() {
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
                //TODO add this case
                break
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
