//
//  LocationManager.swift
//  hw4
//
//  Created by Blake Boris on 6/2/23.
//

import SwiftUI
import MapKit

class Location: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var manager: CLLocationManager? = CLLocationManager()
    @Published var location: CLLocation? = CLLocation()
    
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var areLocationServicesEnabled = false {
        didSet {
            if areLocationServicesEnabled {
                manager = CLLocationManager()
                isUpdatingLocation = true
            } else {
                manager = nil
                isUpdatingLocation = false
            }
        }
    }
    @Published var isUpdatingLocation = false {
        didSet {
            if let locationManager = manager {
                if isUpdatingLocation {
                    locationManager.startUpdatingLocation()
                } else {
                    locationManager.stopUpdatingLocation()
                }
            }
            else {
                if isUpdatingLocation {
                    isUpdatingLocation = false
                }
            }
        }
    }
    @Published var accuracy: LocationAccuracy = .best {
        didSet {
            if let locationManager = manager {
                locationManager.desiredAccuracy = accuracy.rawValue
            }
        }
    }
    
    override init() {
        super.init()
        
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            manager!.delegate = self
        }
    }
    
    private func getlocationAuthorization() -> CLAuthorizationStatus {
        guard let locationManager = manager else { return .notDetermined }
        
        switch locationManager.authorizationStatus {
            case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                areLocationServicesEnabled = true
                isUpdatingLocation = true
            case .restricted, .denied:
                break
            @unknown default:
                isUpdatingLocation = false
        }
        
        authorizationStatus = locationManager.authorizationStatus
        
        return locationManager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        isUpdatingLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isUpdatingLocation = false
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        _ = getlocationAuthorization()
    }
    
    func openSettings() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        }
    }
}
