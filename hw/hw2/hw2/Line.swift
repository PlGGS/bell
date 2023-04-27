//
//  Line.swift
//  hw2
//
//  Created by Blake Boris on 4/27/23.
//

import Foundation

enum Line: String {
    case red = "Red"
    case blue = "Blue"
    case green = "Green"
    case brown = "Brown"
    case purple = "Purple"
    case purpleexp = "PurpleExp"
    case yellow = "Yellow"
    case pink = "Pink"
    case orange = "Orange"
    
    var name: String {
        switch self {
            case .red: return "Red Line"
            case .blue: return "Blue Line"
            case .green: return "Green Line"
            case .brown: return "Brown Line"
            case .purple: return "Purple Line"
            case .purpleexp: return "Purple Line Express (Rush Hour Only)"
            case .yellow: return "Yellow Line"
            case .pink: return "Pink Line"
            case .orange: return "Orange Line"
        }
    }
}
