//
//  Line.swift
//  hw2
//
//  Created by Blake Boris on 4/27/23.
//

import Foundation

enum Line: String, CaseIterable, Identifiable, Hashable {
    var id: Self {
        self
    }
    
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
    
    var stops: Array<Terminal> {
        switch self {
            case .red: return [Terminal.howardRedPurpleYellowlines, Terminal.jarvisRedLine, Terminal.morseRedLine, Terminal.loyolaRedLine, Terminal.granvilleRedLine, Terminal.thorndaleRedLine, Terminal.brynMawrRedLine, Terminal.berwynRedLine, Terminal.argyleRedLine, Terminal.lawrenceRedLine, Terminal.wilsonRedPurplelines, Terminal.sheridanRedLine, Terminal.addisonRedLine, Terminal.belmontRedBrownPurplelines, Terminal.fullertonRedBrownPurplelines, Terminal.northClybournRedLine, Terminal.clarkDivisionRedLine, Terminal.chicagoRedLine, Terminal.grandRedLine, Terminal.lakeRedLine, Terminal.monroeRedLine, Terminal.jacksonRedLine, Terminal.harrisonRedLine, Terminal.rooseveltRedOrangeGreenlines, Terminal.cermakChinatownRedLine, Terminal.soxthirtyFifthRedLine, Terminal.fortySeventhRedLine, Terminal.garfieldRedLine, Terminal.sixtyThirdRedLine, Terminal.sixtyNinthRedLine, Terminal.seventyNinthRedLine, Terminal.eightySeventhRedLine, Terminal.ninetyFifthDanRyanRedLine]
            case .blue: return [Terminal.oHareBlueLine, Terminal.rosemontBlueLine, Terminal.cumberlandBlueLine, Terminal.harlemBlueLineOHareBranch, Terminal.jeffersonParkBlueLine, Terminal.montroseBlueLine, Terminal.irvingParkBlueLine, Terminal.addisonBlueLine, Terminal.belmontBlueLine, Terminal.loganSquareBlueLine, Terminal.californiaBlueLine, Terminal.westernBlueLineOHareBranch, Terminal.damenBlueLine, Terminal.divisionBlueLine, Terminal.chicagoBlueLine, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines, Terminal.washingtonBlueLine, Terminal.monroeBlueLine, Terminal.jacksonBlueLine, Terminal.laSalleBlueLine, Terminal.clintonBlueLine, Terminal.uICHalstedBlueLine, Terminal.racineBlueLine, Terminal.illinoisMedicalDistrictBlueLine, Terminal.westernBlueLineForestParkBranch, Terminal.kedzieHomanBlueLine, Terminal.pulaskiBlueLine, Terminal.ciceroBlueLine, Terminal.austinBlueLine, Terminal.oakParkBlueLine, Terminal.harlemBlueLineForestParkBranch, Terminal.forestParkBlueLine]
            case .green: return [Terminal.harlemLakeGreenLine, Terminal.oakParkGreenLine, Terminal.ridgelandGreenLine, Terminal.austinGreenLine, Terminal.centralGreenLine, Terminal.laramieGreenLine, Terminal.ciceroGreenLine, Terminal.pulaskiGreenLine, Terminal.conservatoryGreenLine, Terminal.kedzieGreenLine, Terminal.californiaGreenLine, Terminal.ashlandGreenPinklines, Terminal.morganGreenPinklines, Terminal.clintonGreenPinklines, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines, Terminal.stateLakeBrownGreenOrangePinkPurplelines, Terminal.washingtonWabashBrownGreenOrangePurplePinklines, Terminal.adamsWabashBrownGreenOrangePinkPurplelines, Terminal.rooseveltRedOrangeGreenlines, Terminal.cermakMcCormickPlaceGreenLine, Terminal.thirtyFifthBronzevilleIITGreenLine, Terminal.indianaGreenLine, Terminal.fortyThirdGreenLine, Terminal.fortySeventhGreenLine, Terminal.fiftyFirstGreenLine, Terminal.garfieldGreenLine, Terminal.halstedGreenLine, Terminal.ashlandsixtyThirdGreenLine, Terminal.kingDriveGreenLine, Terminal.cottageGroveGreenLine]
            case .brown: return [Terminal.kimballBrownLine, Terminal.kedzieBrownLine, Terminal.franciscoBrownLine, Terminal.rockwellBrownLine, Terminal.westernBrownLine, Terminal.damenBrownLine, Terminal.montroseBrownLine, Terminal.irvingParkBrownLine, Terminal.addisonBrownLine, Terminal.paulinaBrownLine, Terminal.southportBrownLine, Terminal.belmontRedBrownPurplelines, Terminal.wellingtonBrownPurplelines, Terminal.diverseyBrownPurplelines, Terminal.fullertonRedBrownPurplelines, Terminal.armitageBrownPurplelines, Terminal.sedgwickBrownPurplelines, Terminal.chicagoBrownPurplelines, Terminal.merchandiseMartBrownPurplelines, Terminal.washingtonWellsBrownOrangePurplePinklines, Terminal.quincyWellsBrownOrangePurplePinklines, Terminal.laSalleVanBurenBrownOrangePurplePinklines, Terminal.haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines, Terminal.adamsWabashBrownGreenOrangePinkPurplelines, Terminal.washingtonWabashBrownGreenOrangePurplePinklines, Terminal.stateLakeBrownGreenOrangePinkPurplelines, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines]
            case .purple: return [Terminal.lindenPurpleLine, Terminal.centralPurpleLine, Terminal.noyesPurpleLine, Terminal.fosterPurpleLine, Terminal.davisPurpleLine, Terminal.dempsterPurpleLine, Terminal.mainPurpleLine, Terminal.southBoulevardPurpleLine, Terminal.howardRedPurpleYellowlines]
            case .purpleexp: return [Terminal.wilsonRedPurplelines, Terminal.belmontRedBrownPurplelines, Terminal.wellingtonBrownPurplelines, Terminal.diverseyBrownPurplelines, Terminal.fullertonRedBrownPurplelines, Terminal.armitageBrownPurplelines, Terminal.sedgwickBrownPurplelines, Terminal.chicagoBrownPurplelines, Terminal.merchandiseMartBrownPurplelines, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines, Terminal.stateLakeBrownGreenOrangePinkPurplelines, Terminal.washingtonWabashBrownGreenOrangePurplePinklines, Terminal.adamsWabashBrownGreenOrangePinkPurplelines, Terminal.haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines, Terminal.laSalleVanBurenBrownOrangePurplePinklines, Terminal.quincyWellsBrownOrangePurplePinklines, Terminal.washingtonWellsBrownOrangePurplePinklines]
            case .yellow: return [Terminal.dempsterSkokieYellowLine, Terminal.oaktonSkokieYellowLine, Terminal.howardRedPurpleYellowlines]
            case .pink: return [Terminal.fiftyFourthCermakPinkLine, Terminal.ciceroPinkLine, Terminal.kostnerPinkLine, Terminal.pulaskiPinkLine, Terminal.centralParkPinkLine, Terminal.kedziePinkLine, Terminal.californiaPinkLine, Terminal.westernPinkLine, Terminal.damenPinkLine, Terminal.eighteenthPinkLine, Terminal.polkPinkLine, Terminal.ashlandGreenPinklines, Terminal.morganGreenPinklines, Terminal.clintonGreenPinklines, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines, Terminal.stateLakeBrownGreenOrangePinkPurplelines, Terminal.washingtonWabashBrownGreenOrangePurplePinklines, Terminal.adamsWabashBrownGreenOrangePinkPurplelines, Terminal.haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines, Terminal.laSalleVanBurenBrownOrangePurplePinklines, Terminal.quincyWellsBrownOrangePurplePinklines, Terminal.washingtonWellsBrownOrangePurplePinklines]
            case .orange: return [Terminal.midwayOrangeLine, Terminal.pulaskiOrangeLine, Terminal.kedzieOrangeLine, Terminal.westernOrangeLine, Terminal.thirtyFifthArcherOrangeLine, Terminal.ashlandOrangeLine, Terminal.halstedOrangeLine, Terminal.rooseveltRedOrangeGreenlines, Terminal.haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines, Terminal.laSalleVanBurenBrownOrangePurplePinklines, Terminal.quincyWellsBrownOrangePurplePinklines, Terminal.washingtonWellsBrownOrangePurplePinklines, Terminal.clarkLakeBlueBrownGreenOrangePurplePinklines, Terminal.stateLakeBrownGreenOrangePinkPurplelines, Terminal.washingtonWabashBrownGreenOrangePurplePinklines, Terminal.adamsWabashBrownGreenOrangePinkPurplelines]
        }
    }
    
    var firstStop: String {
        switch self {
            case .red:
                return stops[0].shortName
            case .blue:
                return self.stops[0].shortName
            case .brown:
                return self.stops[0].shortName
            case .green:
                return self.stops[0].shortName
            case .orange:
                return self.stops[0].shortName
            case .pink:
                return self.stops[0].shortName
            case .purple:
                return self.stops[0].shortName
            case .yellow:
                return self.stops[0].shortName
            case .purpleexp:
                return self.stops[0].shortName
        }
    }

    var lastStop: String {
        switch self {
            case .red:
                return self.stops[stops.count - 1].shortName
            case .blue:
                return self.stops[stops.count - 1].shortName
            case .brown:
                return self.stops[stops.count - 1].shortName
            case .green:
                return self.stops[stops.count - 1].shortName
            case .orange:
                return self.stops[stops.count - 1].shortName
            case .pink:
                return self.stops[stops.count - 1].shortName
            case .purple:
                return self.stops[stops.count - 1].shortName
            case .yellow:
                return self.stops[stops.count - 1].shortName
            case .purpleexp:
                return self.stops[stops.count - 1].shortName
        }
    }

    var serviceString: String {
        "Service from \(firstStop) to \(lastStop)"
    }
}
