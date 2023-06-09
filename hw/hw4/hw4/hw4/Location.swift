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
                isUpdatingHeading = true
            } else {
                manager = nil
                isUpdatingLocation = false
                isUpdatingHeading = false
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
    @Published var isUpdatingHeading = false {
        didSet {
            if let locationManager = manager {
                if isUpdatingHeading {
                    locationManager.startUpdatingHeading()
                } else {
                    locationManager.stopUpdatingHeading()
                }
            }
            else {
                if isUpdatingHeading {
                    isUpdatingHeading = false
                }
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
                isUpdatingHeading = true
            case .restricted, .denied:
                break
            @unknown default:
                isUpdatingLocation = false
                isUpdatingHeading = false
        }
        
        return locationManager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        isUpdatingLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        isUpdatingHeading = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isUpdatingLocation = false
        isUpdatingHeading = false
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = getlocationAuthorization()
    }
    
    func openSettings() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        }
    }
}
