//
//  Line.swift
//  hw2
//
//  Created by Blake Boris on 4/27/23.
//

import Foundation

enum Line: String, CaseIterable {
    case red = "Red"
    case blue = "Blue"
    case green = "G"
    case brown = "Brn"
    case purple = "P"
    case purpleexp = "Pexp"
    case yellow = "Y"
    case pink = "Pink"
    case orange = "Org"
    
    var shortName: String {
        switch self {
            case .red: return "Red"
            case .blue: return "Blue"
            case .green: return "Green"
            case .brown: return "Brown"
            case .purple: return "Purple"
            case .purpleexp: return "PurpleExp"
            case .yellow: return "Yellow"
            case .pink: return "Pink"
            case .orange: return "Orange"
        }
    }
    
    var fullName: String {
        switch self {
            case .red: return "Red Line"
            case .blue: return "Blue Line"
            case .green: return "Green Line"
            case .brown: return "Brown Line"
            case .purple: return "Purple Line"
            case .purpleexp: return "Purple Line Express"
            case .yellow: return "Yellow Line"
            case .pink: return "Pink Line"
            case .orange: return "Orange Line"
        }
    }
}
