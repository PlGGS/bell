//
//  LocationAccuracy.swift
//  hw4
//
//  Created by Blake Boris on 6/9/23.
//

import CoreLocation

enum LocationAccuracy: CLLocationAccuracy, CaseIterable {
    case best
    case bestForNavigation
    case nearestTenMeters
    case hundredMeters
    case kilometer
    case threeKilometers

    var stringValue: String {
        switch self {
            case .best:
                return "Best"
            case .bestForNavigation:
                return "Best for Navigation"
            case .nearestTenMeters:
                return "Nearest 10 meters"
            case .hundredMeters:
                return "100 meters"
            case .kilometer:
                return "1 kilometer"
            case .threeKilometers:
                return "3 kilometers"
        }
    }

    init(accuracy: CLLocationAccuracy) {
        switch accuracy {
            case kCLLocationAccuracyBest:
                self = .best
            case kCLLocationAccuracyBestForNavigation:
                self = .bestForNavigation
            case kCLLocationAccuracyNearestTenMeters:
                self = .nearestTenMeters
            case kCLLocationAccuracyHundredMeters:
                self = .hundredMeters
            case kCLLocationAccuracyKilometer:
                self = .kilometer
            case kCLLocationAccuracyThreeKilometers:
                self = .threeKilometers
            default:
                self = .best
        }
    }
}
