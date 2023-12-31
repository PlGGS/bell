//
//  Terminals.swift
//  Bell
//
//  Created by Blake Boris on 4/26/23.
//

enum Terminal: Int, CaseIterable, Identifiable {
    var id: Self {
        self
    }
    
    case ciceroPinkLine = 40420
    case centralParkPinkLine = 40780
    case halstedGreenLine = 40940
    case cumberlandBlueLine = 40230
    case racineBlueLine = 40470
    case paulinaBrownLine = 41310
    case eighteenthPinkLine = 40830
    case clarkLakeBlueBrownGreenOrangePurplePinklines = 40380
    case jeffersonParkBlueLine = 41280
    case diverseyBrownPurplelines = 40530
    case montroseBrownLine = 41500
    case uICHalstedBlueLine = 40350
    case thirtyFifthBronzevilleIITGreenLine = 41120
    case fosterPurpleLine = 40520
    case quincyWellsBrownOrangePurplePinklines = 40040
    case southportBrownLine = 40360
    case loyolaRedLine = 41300
    case fortySeventhRedLine = 41230
    case brynMawrRedLine = 41380
    case harlemBlueLineForestParkBranch = 40980
    case howardRedPurpleYellowlines = 40900
    case kedzieGreenLine = 41070
    case kingDriveGreenLine = 41140
    case ashlandsixtyThirdGreenLine = 40290
    case ninetyFifthDanRyanRedLine = 40450
    case westernBlueLineOHareBranch = 40670
    case armitageBrownPurplelines = 40660
    case rooseveltRedOrangeGreenlines = 41400
    case belmontRedBrownPurplelines = 41320
    case fiftyFourthCermakPinkLine = 40580
    case dempsterPurpleLine = 40690
    case fullertonRedBrownPurplelines = 41220
    case lawrenceRedLine = 40770
    case illinoisMedicalDistrictBlueLine = 40810
    case lakeRedLine = 41660
    case seventyNinthRedLine = 40240
    case austinGreenLine = 41260
    case clintonBlueLine = 40430
    case wellingtonBrownPurplelines = 41210
    case oakParkGreenLine = 41350
    case chicagoRedLine = 41450
    case sedgwickBrownPurplelines = 40800
    case addisonBlueLine = 41240
    case jacksonBlueLine = 40070
    case kedziePinkLine = 41040
    case monroeBlueLine = 40790
    case rockwellBrownLine = 41010
    case damenPinkLine = 40210
    case pulaskiBlueLine = 40920
    case harlemLakeGreenLine = 40020
    case washingtonWabashBrownGreenOrangePurplePinklines = 41700
    case californiaGreenLine = 41360
    case morseRedLine = 40100
    case westernOrangeLine = 40310
    case grandBlueLine = 40490
    case divisionBlueLine = 40320
    case pulaskiOrangeLine = 40960
    case sheridanRedLine = 40080
    case chicagoBlueLine = 41410
    case merchandiseMartBrownPurplelines = 40460
    case oHareBlueLine = 40890
    case fortyThirdGreenLine = 41270
    case soxthirtyFifthRedLine = 40190
    case loganSquareBlueLine = 41020
    case damenBlueLine = 40590
    case ashlandGreenPinklines = 40170
    case irvingParkBlueLine = 40550
    case wilsonRedPurplelines = 40540
    case cermakChinatownRedLine = 41000
    case laSalleBlueLine = 41340
    case thorndaleRedLine = 40880
    case granvilleRedLine = 40760
    case addisonRedLine = 41420
    case centralGreenLine = 40280
    case conservatoryGreenLine = 41670
    case noyesPurpleLine = 40400
    case fortySeventhGreenLine = 41080
    case jarvisRedLine = 41190
    case halstedOrangeLine = 41130
    case davisPurpleLine = 40050
    case chicagoBrownPurplelines = 40710
    case monroeRedLine = 41090
    case kedzieBrownLine = 41180
    case fiftyFirstGreenLine = 40130
    case garfieldGreenLine = 40510
    case ashlandOrangeLine = 41060
    case grandRedLine = 40330
    case cermakMcCormickPlaceGreenLine = 41690
    case polkPinkLine = 41030
    case damenBrownLine = 40090
    case pulaskiPinkLine = 40150
    case thirtyFifthArcherOrangeLine = 40120
    case southBoulevardPurpleLine = 40840
    case mainPurpleLine = 40270
    case jacksonRedLine = 40560
    case argyleRedLine = 41200
    case haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines = 40850
    case austinBlueLine = 40010
    case washingtonBlueLine = 40370
    case kedzieHomanBlueLine = 40250
    case sixtyThirdRedLine = 40910
    case kedzieOrangeLine = 41150
    case laramieGreenLine = 40700
    case eightySeventhRedLine = 41430
    case westernBlueLineForestParkBranch = 40220
    case westernBrownLine = 41480
    case californiaBlueLine = 40570
    case forestParkBlueLine = 40390
    case rosemontBlueLine = 40820
    case adamsWabashBrownGreenOrangePinkPurplelines = 40680
    case berwynRedLine = 40340
    case harlemBlueLineOHareBranch = 40750
    case belmontBlueLine = 40060
    case clarkDivisionRedLine = 40630
    case indianaGreenLine = 40300
    case kostnerPinkLine = 40600
    case dempsterSkokieYellowLine = 40140
    case morganGreenPinklines = 41510
    case ciceroBlueLine = 40970
    case oaktonSkokieYellowLine = 41680
    case cottageGroveGreenLine = 40720
    case midwayOrangeLine = 40930
    case centralPurpleLine = 41250
    case pulaskiGreenLine = 40030
    case ridgelandGreenLine = 40610
    case lindenPurpleLine = 41050
    case garfieldRedLine = 41170
    case northClybournRedLine = 40650
    case oakParkBlueLine = 40180
    case irvingParkBrownLine = 41460
    case franciscoBrownLine = 40870
    case laSalleVanBurenBrownOrangePurplePinklines = 40160
    case californiaPinkLine = 40440
    case westernPinkLine = 40740
    case sixtyNinthRedLine = 40990
    case washingtonWellsBrownOrangePurplePinklines = 40730
    case harrisonRedLine = 41490
    case clintonGreenPinklines = 41160
    case kimballBrownLine = 41290
    case addisonBrownLine = 41440
    case stateLakeBrownGreenOrangePinkPurplelines = 40260
    case ciceroGreenLine = 40480
    case montroseBlueLine = 41330
    
    var isADACompliant: Bool {
        switch self {
            case .ciceroPinkLine: return true
            case .centralParkPinkLine: return true
            case .halstedGreenLine: return true
            case .cumberlandBlueLine: return true
            case .racineBlueLine: return false
            case .paulinaBrownLine: return true
            case .eighteenthPinkLine: return true
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return true
            case .jeffersonParkBlueLine: return true
            case .diverseyBrownPurplelines: return true
            case .montroseBrownLine: return true
            case .uICHalstedBlueLine: return true
            case .thirtyFifthBronzevilleIITGreenLine: return true
            case .fosterPurpleLine: return false
            case .quincyWellsBrownOrangePurplePinklines: return true
            case .southportBrownLine: return true
            case .loyolaRedLine: return true
            case .fortySeventhRedLine: return true
            case .brynMawrRedLine: return false
            case .harlemBlueLineForestParkBranch: return false
            case .howardRedPurpleYellowlines: return true
            case .kedzieGreenLine: return true
            case .kingDriveGreenLine: return true
            case .ashlandsixtyThirdGreenLine: return true
            case .ninetyFifthDanRyanRedLine: return true
            case .westernBlueLineOHareBranch: return true
            case .armitageBrownPurplelines: return true
            case .rooseveltRedOrangeGreenlines: return true
            case .belmontRedBrownPurplelines: return true
            case .fiftyFourthCermakPinkLine: return true
            case .dempsterPurpleLine: return false
            case .fullertonRedBrownPurplelines: return true
            case .lawrenceRedLine: return false
            case .illinoisMedicalDistrictBlueLine: return true
            case .lakeRedLine: return true
            case .seventyNinthRedLine: return true
            case .austinGreenLine: return false
            case .clintonBlueLine: return false
            case .wellingtonBrownPurplelines: return true
            case .oakParkGreenLine: return false
            case .chicagoRedLine: return true
            case .sedgwickBrownPurplelines: return true
            case .addisonBlueLine: return true
            case .jacksonBlueLine: return true
            case .kedziePinkLine: return true
            case .monroeBlueLine: return false
            case .rockwellBrownLine: return true
            case .damenPinkLine: return true
            case .pulaskiBlueLine: return false
            case .harlemLakeGreenLine: return true
            case .washingtonWabashBrownGreenOrangePurplePinklines: return true
            case .californiaGreenLine: return true
            case .morseRedLine: return false
            case .westernOrangeLine: return true
            case .grandBlueLine: return false
            case .divisionBlueLine: return false
            case .pulaskiOrangeLine: return true
            case .sheridanRedLine: return false
            case .chicagoBlueLine: return false
            case .merchandiseMartBrownPurplelines: return true
            case .oHareBlueLine: return true
            case .fortyThirdGreenLine: return true
            case .soxthirtyFifthRedLine: return true
            case .loganSquareBlueLine: return true
            case .damenBlueLine: return false
            case .ashlandGreenPinklines: return true
            case .irvingParkBlueLine: return false
            case .wilsonRedPurplelines: return true
            case .cermakChinatownRedLine: return true
            case .laSalleBlueLine: return false
            case .thorndaleRedLine: return false
            case .granvilleRedLine: return true
            case .addisonRedLine: return true
            case .centralGreenLine: return true
            case .conservatoryGreenLine: return true
            case .noyesPurpleLine: return false
            case .fortySeventhGreenLine: return true
            case .jarvisRedLine: return false
            case .halstedOrangeLine: return true
            case .davisPurpleLine: return true
            case .chicagoBrownPurplelines: return true
            case .monroeRedLine: return false
            case .kedzieBrownLine: return true
            case .fiftyFirstGreenLine: return true
            case .garfieldGreenLine: return true
            case .ashlandOrangeLine: return true
            case .grandRedLine: return true
            case .cermakMcCormickPlaceGreenLine: return true
            case .polkPinkLine: return true
            case .damenBrownLine: return true
            case .pulaskiPinkLine: return true
            case .thirtyFifthArcherOrangeLine: return true
            case .southBoulevardPurpleLine: return false
            case .mainPurpleLine: return false
            case .jacksonRedLine: return true
            case .argyleRedLine: return false
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return true
            case .austinBlueLine: return false
            case .washingtonBlueLine: return false
            case .kedzieHomanBlueLine: return true
            case .sixtyThirdRedLine: return true
            case .kedzieOrangeLine: return true
            case .laramieGreenLine: return true
            case .eightySeventhRedLine: return true
            case .westernBlueLineForestParkBranch: return false
            case .westernBrownLine: return true
            case .californiaBlueLine: return false
            case .forestParkBlueLine: return true
            case .rosemontBlueLine: return true
            case .adamsWabashBrownGreenOrangePinkPurplelines: return false
            case .berwynRedLine: return false
            case .harlemBlueLineOHareBranch: return true
            case .belmontBlueLine: return false
            case .clarkDivisionRedLine: return true
            case .indianaGreenLine: return true
            case .kostnerPinkLine: return true
            case .dempsterSkokieYellowLine: return true
            case .morganGreenPinklines: return true
            case .ciceroBlueLine: return false
            case .oaktonSkokieYellowLine: return true
            case .cottageGroveGreenLine: return true
            case .midwayOrangeLine: return true
            case .centralPurpleLine: return false
            case .pulaskiGreenLine: return true
            case .ridgelandGreenLine: return false
            case .lindenPurpleLine: return true
            case .garfieldRedLine: return true
            case .northClybournRedLine: return false
            case .oakParkBlueLine: return false
            case .irvingParkBrownLine: return true
            case .franciscoBrownLine: return true
            case .laSalleVanBurenBrownOrangePurplePinklines: return false
            case .californiaPinkLine: return true
            case .westernPinkLine: return true
            case .sixtyNinthRedLine: return true
            case .washingtonWellsBrownOrangePurplePinklines: return true
            case .harrisonRedLine: return false
            case .clintonGreenPinklines: return true
            case .kimballBrownLine: return true
            case .addisonBrownLine: return true
            case .stateLakeBrownGreenOrangePinkPurplelines: return false
            case .ciceroGreenLine: return true
            case .montroseBlueLine: return false
        }
    }
    
    var lines: Array<Line> {
        switch self {
            case .ciceroPinkLine: return [Line.pink]
            case .centralParkPinkLine: return [Line.pink]
            case .halstedGreenLine: return [Line.green]
            case .cumberlandBlueLine: return [Line.blue]
            case .racineBlueLine: return [Line.blue]
            case .paulinaBrownLine: return [Line.brown]
            case .eighteenthPinkLine: return [Line.pink]
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return [Line.blue, Line.green, Line.brown, Line.purpleexp, Line.pink, Line.orange]
            case .jeffersonParkBlueLine: return [Line.blue]
            case .diverseyBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .montroseBrownLine: return [Line.brown]
            case .uICHalstedBlueLine: return [Line.blue]
            case .thirtyFifthBronzevilleIITGreenLine: return [Line.green]
            case .fosterPurpleLine: return [Line.purple, Line.purpleexp]
            case .quincyWellsBrownOrangePurplePinklines: return [Line.brown, Line.purpleexp, Line.pink, Line.orange]
            case .southportBrownLine: return [Line.brown]
            case .loyolaRedLine: return [Line.red]
            case .fortySeventhRedLine: return [Line.red]
            case .brynMawrRedLine: return [Line.red]
            case .harlemBlueLineForestParkBranch: return [Line.blue]
            case .howardRedPurpleYellowlines: return [Line.red, Line.purple, Line.purpleexp, Line.yellow]
            case .kedzieGreenLine: return [Line.green]
            case .kingDriveGreenLine: return [Line.green]
            case .ashlandsixtyThirdGreenLine: return [Line.green]
            case .ninetyFifthDanRyanRedLine: return [Line.red]
            case .westernBlueLineOHareBranch: return [Line.blue]
            case .armitageBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .rooseveltRedOrangeGreenlines: return [Line.red, Line.green, Line.orange]
            case .belmontRedBrownPurplelines: return [Line.red, Line.brown, Line.purpleexp]
            case .fiftyFourthCermakPinkLine: return [Line.pink]
            case .dempsterPurpleLine: return [Line.purple, Line.purpleexp]
            case .fullertonRedBrownPurplelines: return [Line.brown, Line.purpleexp, Line.red]
            case .lawrenceRedLine: return [Line.red]
            case .illinoisMedicalDistrictBlueLine: return [Line.blue]
            case .lakeRedLine: return [Line.red]
            case .seventyNinthRedLine: return [Line.red]
            case .austinGreenLine: return [Line.green]
            case .clintonBlueLine: return [Line.blue]
            case .wellingtonBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .oakParkGreenLine: return [Line.green]
            case .chicagoRedLine: return [Line.red]
            case .sedgwickBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .addisonBlueLine: return [Line.blue]
            case .jacksonBlueLine: return [Line.blue]
            case .kedziePinkLine: return [Line.pink]
            case .monroeBlueLine: return [Line.blue]
            case .rockwellBrownLine: return [Line.brown]
            case .damenPinkLine: return [Line.pink]
            case .pulaskiBlueLine: return [Line.blue]
            case .harlemLakeGreenLine: return [Line.green]
            case .washingtonWabashBrownGreenOrangePurplePinklines: return [Line.green, Line.purpleexp, Line.pink, Line.orange, Line.brown]
            case .californiaGreenLine: return [Line.green]
            case .morseRedLine: return [Line.red]
            case .westernOrangeLine: return [Line.orange]
            case .grandBlueLine: return [Line.blue]
            case .divisionBlueLine: return [Line.blue]
            case .pulaskiOrangeLine: return [Line.orange]
            case .sheridanRedLine: return [Line.red]
            case .chicagoBlueLine: return [Line.blue]
            case .merchandiseMartBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .oHareBlueLine: return [Line.blue]
            case .fortyThirdGreenLine: return [Line.green]
            case .soxthirtyFifthRedLine: return [Line.red]
            case .loganSquareBlueLine: return [Line.blue]
            case .damenBlueLine: return [Line.blue]
            case .ashlandGreenPinklines: return [Line.green, Line.pink]
            case .irvingParkBlueLine: return [Line.blue]
            case .wilsonRedPurplelines: return [Line.purpleexp, Line.red]
            case .cermakChinatownRedLine: return [Line.red]
            case .laSalleBlueLine: return [Line.blue]
            case .thorndaleRedLine: return [Line.red]
            case .granvilleRedLine: return [Line.red]
            case .addisonRedLine: return [Line.red]
            case .centralGreenLine: return [Line.green]
            case .conservatoryGreenLine: return [Line.green]
            case .noyesPurpleLine: return [Line.purple, Line.purpleexp]
            case .fortySeventhGreenLine: return [Line.green]
            case .jarvisRedLine: return [Line.red]
            case .halstedOrangeLine: return [Line.orange]
            case .davisPurpleLine: return [Line.purple, Line.purpleexp]
            case .chicagoBrownPurplelines: return [Line.brown, Line.purpleexp]
            case .monroeRedLine: return [Line.red]
            case .kedzieBrownLine: return [Line.brown]
            case .fiftyFirstGreenLine: return [Line.green]
            case .garfieldGreenLine: return [Line.green]
            case .ashlandOrangeLine: return [Line.orange]
            case .grandRedLine: return [Line.red]
            case .cermakMcCormickPlaceGreenLine: return [Line.green]
            case .polkPinkLine: return [Line.pink]
            case .damenBrownLine: return [Line.brown]
            case .pulaskiPinkLine: return [Line.pink]
            case .thirtyFifthArcherOrangeLine: return [Line.orange]
            case .southBoulevardPurpleLine: return [Line.purple, Line.purpleexp]
            case .mainPurpleLine: return [Line.purple, Line.purpleexp]
            case .jacksonRedLine: return [Line.red]
            case .argyleRedLine: return [Line.red]
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return [Line.brown, Line.purpleexp, Line.pink, Line.orange]
            case .austinBlueLine: return [Line.blue]
            case .washingtonBlueLine: return [Line.blue]
            case .kedzieHomanBlueLine: return [Line.blue]
            case .sixtyThirdRedLine: return [Line.red]
            case .kedzieOrangeLine: return [Line.orange]
            case .laramieGreenLine: return [Line.green]
            case .eightySeventhRedLine: return [Line.red]
            case .westernBlueLineForestParkBranch: return [Line.blue]
            case .westernBrownLine: return [Line.brown]
            case .californiaBlueLine: return [Line.blue]
            case .forestParkBlueLine: return [Line.blue]
            case .rosemontBlueLine: return [Line.blue]
            case .adamsWabashBrownGreenOrangePinkPurplelines: return [Line.green, Line.purpleexp, Line.pink, Line.orange, Line.brown]
            case .berwynRedLine: return [Line.red]
            case .harlemBlueLineOHareBranch: return [Line.blue]
            case .belmontBlueLine: return [Line.blue]
            case .clarkDivisionRedLine: return [Line.red]
            case .indianaGreenLine: return [Line.green]
            case .kostnerPinkLine: return [Line.pink]
            case .dempsterSkokieYellowLine: return [Line.yellow]
            case .morganGreenPinklines: return [Line.green, Line.pink]
            case .ciceroBlueLine: return [Line.blue]
            case .oaktonSkokieYellowLine: return [Line.yellow]
            case .cottageGroveGreenLine: return [Line.green]
            case .midwayOrangeLine: return [Line.orange]
            case .centralPurpleLine: return [Line.purple, Line.purpleexp]
            case .pulaskiGreenLine: return [Line.green]
            case .ridgelandGreenLine: return [Line.green]
            case .lindenPurpleLine: return [Line.purple, Line.purpleexp]
            case .garfieldRedLine: return [Line.red]
            case .northClybournRedLine: return [Line.red]
            case .oakParkBlueLine: return [Line.blue]
            case .irvingParkBrownLine: return [Line.brown]
            case .franciscoBrownLine: return [Line.brown]
            case .laSalleVanBurenBrownOrangePurplePinklines: return [Line.brown, Line.purpleexp, Line.pink, Line.orange]
            case .californiaPinkLine: return [Line.pink]
            case .westernPinkLine: return [Line.pink]
            case .sixtyNinthRedLine: return [Line.red]
            case .washingtonWellsBrownOrangePurplePinklines: return [Line.purpleexp, Line.pink, Line.orange, Line.brown]
            case .harrisonRedLine: return [Line.red]
            case .clintonGreenPinklines: return [Line.green, Line.pink]
            case .kimballBrownLine: return [Line.brown]
            case .addisonBrownLine: return [Line.brown]
            case .stateLakeBrownGreenOrangePinkPurplelines: return [Line.green, Line.brown, Line.purpleexp, Line.pink, Line.orange]
            case .ciceroGreenLine: return [Line.green]
            case .montroseBlueLine: return [Line.blue]
        }
    }
    
    var shortName: String {
        switch self {
            case .ciceroPinkLine: return "Cicero"
            case .centralParkPinkLine: return "Central Park"
            case .halstedGreenLine: return "Halsted"
            case .cumberlandBlueLine: return "Cumberland"
            case .racineBlueLine: return "Racine"
            case .paulinaBrownLine: return "Paulina"
            case .eighteenthPinkLine: return "18th"
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return "Clark/Lake"
            case .jeffersonParkBlueLine: return "Jefferson Park"
            case .diverseyBrownPurplelines: return "Diversey"
            case .montroseBrownLine: return "Montrose"
            case .uICHalstedBlueLine: return "UIC-Halsted"
            case .thirtyFifthBronzevilleIITGreenLine: return "35th-Bronzeville-IIT"
            case .fosterPurpleLine: return "Foster"
            case .quincyWellsBrownOrangePurplePinklines: return "Quincy/Wells"
            case .southportBrownLine: return "Southport"
            case .loyolaRedLine: return "Loyola"
            case .fortySeventhRedLine: return "47th"
            case .brynMawrRedLine: return "Bryn Mawr"
            case .harlemBlueLineForestParkBranch: return "Harlem"
            case .howardRedPurpleYellowlines: return "Howard"
            case .kedzieGreenLine: return "Kedzie"
            case .kingDriveGreenLine: return "King Drive"
            case .ashlandsixtyThirdGreenLine: return "Ashland/63rd"
            case .ninetyFifthDanRyanRedLine: return "95th/Dan Ryan"
            case .westernBlueLineOHareBranch: return "Western"
            case .armitageBrownPurplelines: return "Armitage"
            case .rooseveltRedOrangeGreenlines: return "Roosevelt"
            case .belmontRedBrownPurplelines: return "Belmont"
            case .fiftyFourthCermakPinkLine: return "54th/Cermak"
            case .dempsterPurpleLine: return "Dempster"
            case .fullertonRedBrownPurplelines: return "Fullerton"
            case .lawrenceRedLine: return "Lawrence"
            case .illinoisMedicalDistrictBlueLine: return "Illinois Medical District"
            case .lakeRedLine: return "Lake"
            case .seventyNinthRedLine: return "79th"
            case .austinGreenLine: return "Austin"
            case .clintonBlueLine: return "Clinton"
            case .wellingtonBrownPurplelines: return "Wellington"
            case .oakParkGreenLine: return "Oak Park"
            case .chicagoRedLine: return "Chicago"
            case .sedgwickBrownPurplelines: return "Sedgwick"
            case .addisonBlueLine: return "Addison"
            case .jacksonBlueLine: return "Jackson"
            case .kedziePinkLine: return "Kedzie"
            case .monroeBlueLine: return "Monroe"
            case .rockwellBrownLine: return "Rockwell"
            case .damenPinkLine: return "Damen"
            case .pulaskiBlueLine: return "Pulaski"
            case .harlemLakeGreenLine: return "Harlem/Lake"
            case .washingtonWabashBrownGreenOrangePurplePinklines: return "Washington/Wabash"
            case .californiaGreenLine: return "California"
            case .morseRedLine: return "Morse"
            case .westernOrangeLine: return "Western"
            case .grandBlueLine: return "Grand"
            case .divisionBlueLine: return "Division"
            case .pulaskiOrangeLine: return "Pulaski"
            case .sheridanRedLine: return "Sheridan"
            case .chicagoBlueLine: return "Chicago"
            case .merchandiseMartBrownPurplelines: return "Merchandise Mart"
            case .oHareBlueLine: return "O'Hare"
            case .fortyThirdGreenLine: return "43rd"
            case .soxthirtyFifthRedLine: return "Sox-35th"
            case .loganSquareBlueLine: return "Logan Square"
            case .damenBlueLine: return "Damen"
            case .ashlandGreenPinklines: return "Ashland"
            case .irvingParkBlueLine: return "Irving Park"
            case .wilsonRedPurplelines: return "Wilson"
            case .cermakChinatownRedLine: return "Cermak-Chinatown"
            case .laSalleBlueLine: return "LaSalle"
            case .thorndaleRedLine: return "Thorndale"
            case .granvilleRedLine: return "Granville"
            case .addisonRedLine: return "Addison"
            case .centralGreenLine: return "Central"
            case .conservatoryGreenLine: return "Conservatory"
            case .noyesPurpleLine: return "Noyes"
            case .fortySeventhGreenLine: return "47th"
            case .jarvisRedLine: return "Jarvis"
            case .halstedOrangeLine: return "Halsted"
            case .davisPurpleLine: return "Davis"
            case .chicagoBrownPurplelines: return "Chicago"
            case .monroeRedLine: return "Monroe"
            case .kedzieBrownLine: return "Kedzie"
            case .fiftyFirstGreenLine: return "51st"
            case .garfieldGreenLine: return "Garfield"
            case .ashlandOrangeLine: return "Ashland"
            case .grandRedLine: return "Grand"
            case .cermakMcCormickPlaceGreenLine: return "Cermak-McCormick Place"
            case .polkPinkLine: return "Polk"
            case .damenBrownLine: return "Damen"
            case .pulaskiPinkLine: return "Pulaski"
            case .thirtyFifthArcherOrangeLine: return "35th/Archer"
            case .southBoulevardPurpleLine: return "South Boulevard"
            case .mainPurpleLine: return "Main"
            case .jacksonRedLine: return "Jackson"
            case .argyleRedLine: return "Argyle"
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return "Harold Washington Library-State/Van Buren"
            case .austinBlueLine: return "Austin"
            case .washingtonBlueLine: return "Washington"
            case .kedzieHomanBlueLine: return "Kedzie-Homan"
            case .sixtyThirdRedLine: return "63rd"
            case .kedzieOrangeLine: return "Kedzie"
            case .laramieGreenLine: return "Laramie"
            case .eightySeventhRedLine: return "87th"
            case .westernBlueLineForestParkBranch: return "Western"
            case .westernBrownLine: return "Western"
            case .californiaBlueLine: return "California"
            case .forestParkBlueLine: return "Forest Park"
            case .rosemontBlueLine: return "Rosemont"
            case .adamsWabashBrownGreenOrangePinkPurplelines: return "Adams/Wabash"
            case .berwynRedLine: return "Berwyn"
            case .harlemBlueLineOHareBranch: return "Harlem"
            case .belmontBlueLine: return "Belmont"
            case .clarkDivisionRedLine: return "Clark/Division"
            case .indianaGreenLine: return "Indiana"
            case .kostnerPinkLine: return "Kostner"
            case .dempsterSkokieYellowLine: return "Dempster-Skokie"
            case .morganGreenPinklines: return "Morgan"
            case .ciceroBlueLine: return "Cicero"
            case .oaktonSkokieYellowLine: return "Oakton-Skokie"
            case .cottageGroveGreenLine: return "Cottage Grove"
            case .midwayOrangeLine: return "Midway"
            case .centralPurpleLine: return "Central"
            case .pulaskiGreenLine: return "Pulaski"
            case .ridgelandGreenLine: return "Ridgeland"
            case .lindenPurpleLine: return "Linden"
            case .garfieldRedLine: return "Garfield"
            case .northClybournRedLine: return "North/Clybourn"
            case .oakParkBlueLine: return "Oak Park"
            case .irvingParkBrownLine: return "Irving Park"
            case .franciscoBrownLine: return "Francisco"
            case .laSalleVanBurenBrownOrangePurplePinklines: return "LaSalle/Van Buren"
            case .californiaPinkLine: return "California"
            case .westernPinkLine: return "Western"
            case .sixtyNinthRedLine: return "69th"
            case .washingtonWellsBrownOrangePurplePinklines: return "Washington/Wells"
            case .harrisonRedLine: return "Harrison"
            case .clintonGreenPinklines: return "Clinton"
            case .kimballBrownLine: return "Kimball"
            case .addisonBrownLine: return "Addison"
            case .stateLakeBrownGreenOrangePinkPurplelines: return "State/Lake"
            case .ciceroGreenLine: return "Cicero"
            case .montroseBlueLine: return "Montrose"
        }
    }
    
    var fullName: String {
        switch self {
            case .ciceroPinkLine: return "Cicero (Pink Line)"
            case .centralParkPinkLine: return "Central Park (Pink Line)"
            case .halstedGreenLine: return "Halsted (Green Line)"
            case .cumberlandBlueLine: return "Cumberland (Blue Line)"
            case .racineBlueLine: return "Racine (Blue Line)"
            case .paulinaBrownLine: return "Paulina (Brown Line)"
            case .eighteenthPinkLine: return "18th (Pink Line)"
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return "Clark/Lake (Blue, Brown, Green, Orange, Purple & Pink lines)"
            case .jeffersonParkBlueLine: return "Jefferson Park (Blue Line)"
            case .diverseyBrownPurplelines: return "Diversey (Brown & Purple lines)"
            case .montroseBrownLine: return "Montrose (Brown Line)"
            case .uICHalstedBlueLine: return "UIC-Halsted (Blue Line)"
            case .thirtyFifthBronzevilleIITGreenLine: return "35th-Bronzeville-IIT (Green Line)"
            case .fosterPurpleLine: return "Foster (Purple Line)"
            case .quincyWellsBrownOrangePurplePinklines: return "Quincy/Wells (Brown, Orange, Purple & Pink lines)"
            case .southportBrownLine: return "Southport (Brown Line)"
            case .loyolaRedLine: return "Loyola (Red Line)"
            case .fortySeventhRedLine: return "47th (Red Line)"
            case .brynMawrRedLine: return "Bryn Mawr (Red Line)"
            case .harlemBlueLineForestParkBranch: return "Harlem (Blue Line - Forest Park Branch)"
            case .howardRedPurpleYellowlines: return "Howard (Red, Purple & Yellow lines)"
            case .kedzieGreenLine: return "Kedzie (Green Line)"
            case .kingDriveGreenLine: return "King Drive (Green Line)"
            case .ashlandsixtyThirdGreenLine: return "Ashland/63rd (Green Line)"
            case .ninetyFifthDanRyanRedLine: return "95th/Dan Ryan (Red Line)"
            case .westernBlueLineOHareBranch: return "Western (Blue Line - O'Hare Branch)"
            case .armitageBrownPurplelines: return "Armitage (Brown & Purple lines)"
            case .rooseveltRedOrangeGreenlines: return "Roosevelt (Red, Orange & Green lines)"
            case .belmontRedBrownPurplelines: return "Belmont (Red, Brown & Purple lines)"
            case .fiftyFourthCermakPinkLine: return "54th/Cermak (Pink Line)"
            case .dempsterPurpleLine: return "Dempster (Purple Line)"
            case .fullertonRedBrownPurplelines: return "Fullerton (Red, Brown & Purple lines)"
            case .lawrenceRedLine: return "Lawrence (Red Line)"
            case .illinoisMedicalDistrictBlueLine: return "Illinois Medical District (Blue Line)"
            case .lakeRedLine: return "Lake (Red Line)"
            case .seventyNinthRedLine: return "79th (Red Line)"
            case .austinGreenLine: return "Austin (Green Line)"
            case .clintonBlueLine: return "Clinton (Blue Line)"
            case .wellingtonBrownPurplelines: return "Wellington (Brown & Purple lines)"
            case .oakParkGreenLine: return "Oak Park (Green Line)"
            case .chicagoRedLine: return "Chicago (Red Line)"
            case .sedgwickBrownPurplelines: return "Sedgwick (Brown & Purple lines)"
            case .addisonBlueLine: return "Addison (Blue Line)"
            case .jacksonBlueLine: return "Jackson (Blue Line)"
            case .kedziePinkLine: return "Kedzie (Pink Line)"
            case .monroeBlueLine: return "Monroe (Blue Line)"
            case .rockwellBrownLine: return "Rockwell (Brown Line)"
            case .damenPinkLine: return "Damen (Pink Line)"
            case .pulaskiBlueLine: return "Pulaski (Blue Line)"
            case .harlemLakeGreenLine: return "Harlem/Lake (Green Line)"
            case .washingtonWabashBrownGreenOrangePurplePinklines: return "Washington/Wabash (Brown, Green, Orange, Purple & Pink lines)"
            case .californiaGreenLine: return "California (Green Line)"
            case .morseRedLine: return "Morse (Red Line)"
            case .westernOrangeLine: return "Western (Orange Line)"
            case .grandBlueLine: return "Grand (Blue Line)"
            case .divisionBlueLine: return "Division (Blue Line)"
            case .pulaskiOrangeLine: return "Pulaski (Orange Line)"
            case .sheridanRedLine: return "Sheridan (Red Line)"
            case .chicagoBlueLine: return "Chicago (Blue Line)"
            case .merchandiseMartBrownPurplelines: return "Merchandise Mart (Brown & Purple lines)"
            case .oHareBlueLine: return "O'Hare (Blue Line)"
            case .fortyThirdGreenLine: return "43rd (Green Line)"
            case .soxthirtyFifthRedLine: return "Sox-35th (Red Line)"
            case .loganSquareBlueLine: return "Logan Square (Blue Line)"
            case .damenBlueLine: return "Damen (Blue Line)"
            case .ashlandGreenPinklines: return "Ashland (Green & Pink lines)"
            case .irvingParkBlueLine: return "Irving Park (Blue Line)"
            case .wilsonRedPurplelines: return "Wilson (Red & Purple lines)"
            case .cermakChinatownRedLine: return "Cermak-Chinatown (Red Line)"
            case .laSalleBlueLine: return "LaSalle (Blue Line)"
            case .thorndaleRedLine: return "Thorndale (Red Line)"
            case .granvilleRedLine: return "Granville (Red Line)"
            case .addisonRedLine: return "Addison (Red Line)"
            case .centralGreenLine: return "Central (Green Line)"
            case .conservatoryGreenLine: return "Conservatory (Green Line)"
            case .noyesPurpleLine: return "Noyes (Purple Line)"
            case .fortySeventhGreenLine: return "47th (Green Line)"
            case .jarvisRedLine: return "Jarvis (Red Line)"
            case .halstedOrangeLine: return "Halsted (Orange Line)"
            case .davisPurpleLine: return "Davis (Purple Line)"
            case .chicagoBrownPurplelines: return "Chicago (Brown & Purple lines)"
            case .monroeRedLine: return "Monroe (Red Line)"
            case .kedzieBrownLine: return "Kedzie (Brown Line)"
            case .fiftyFirstGreenLine: return "51st (Green Line)"
            case .garfieldGreenLine: return "Garfield (Green Line)"
            case .ashlandOrangeLine: return "Ashland (Orange Line)"
            case .grandRedLine: return "Grand (Red Line)"
            case .cermakMcCormickPlaceGreenLine: return "Cermak-McCormick Place (Green Line)"
            case .polkPinkLine: return "Polk (Pink Line)"
            case .damenBrownLine: return "Damen (Brown Line)"
            case .pulaskiPinkLine: return "Pulaski (Pink Line)"
            case .thirtyFifthArcherOrangeLine: return "35th/Archer (Orange Line)"
            case .southBoulevardPurpleLine: return "South Boulevard (Purple Line)"
            case .mainPurpleLine: return "Main (Purple Line)"
            case .jacksonRedLine: return "Jackson (Red Line)"
            case .argyleRedLine: return "Argyle (Red Line)"
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return "Harold Washington Library-State/Van Buren (Brown, Orange, Purple & Pink lines)"
            case .austinBlueLine: return "Austin (Blue Line)"
            case .washingtonBlueLine: return "Washington (Blue Line)"
            case .kedzieHomanBlueLine: return "Kedzie-Homan (Blue Line)"
            case .sixtyThirdRedLine: return "63rd (Red Line)"
            case .kedzieOrangeLine: return "Kedzie (Orange Line)"
            case .laramieGreenLine: return "Laramie (Green Line)"
            case .eightySeventhRedLine: return "87th (Red Line)"
            case .westernBlueLineForestParkBranch: return "Western (Blue Line - Forest Park Branch)"
            case .westernBrownLine: return "Western (Brown Line)"
            case .californiaBlueLine: return "California (Blue Line)"
            case .forestParkBlueLine: return "Forest Park (Blue Line)"
            case .rosemontBlueLine: return "Rosemont (Blue Line)"
            case .adamsWabashBrownGreenOrangePinkPurplelines: return "Adams/Wabash (Brown, Green, Orange, Pink & Purple lines)"
            case .berwynRedLine: return "Berwyn (Red Line)"
            case .harlemBlueLineOHareBranch: return "Harlem (Blue Line - O'Hare Branch)"
            case .belmontBlueLine: return "Belmont (Blue Line)"
            case .clarkDivisionRedLine: return "Clark/Division (Red Line)"
            case .indianaGreenLine: return "Indiana (Green Line)"
            case .kostnerPinkLine: return "Kostner (Pink Line)"
            case .dempsterSkokieYellowLine: return "Dempster-Skokie  (Yellow Line)"
            case .morganGreenPinklines: return "Morgan (Green & Pink lines)"
            case .ciceroBlueLine: return "Cicero (Blue Line)"
            case .oaktonSkokieYellowLine: return "Oakton-Skokie (Yellow Line)"
            case .cottageGroveGreenLine: return "Cottage Grove (Green Line)"
            case .midwayOrangeLine: return "Midway (Orange Line)"
            case .centralPurpleLine: return "Central (Purple Line)"
            case .pulaskiGreenLine: return "Pulaski (Green Line)"
            case .ridgelandGreenLine: return "Ridgeland (Green Line)"
            case .lindenPurpleLine: return "Linden (Purple Line)"
            case .garfieldRedLine: return "Garfield (Red Line)"
            case .northClybournRedLine: return "North/Clybourn (Red Line)"
            case .oakParkBlueLine: return "Oak Park (Blue Line)"
            case .irvingParkBrownLine: return "Irving Park (Brown Line)"
            case .franciscoBrownLine: return "Francisco (Brown Line)"
            case .laSalleVanBurenBrownOrangePurplePinklines: return "LaSalle/Van Buren (Brown, Orange, Purple & Pink lines)"
            case .californiaPinkLine: return "California (Pink Line)"
            case .westernPinkLine: return "Western (Pink Line)"
            case .sixtyNinthRedLine: return "69th (Red Line)"
            case .washingtonWellsBrownOrangePurplePinklines: return "Washington/Wells (Brown, Orange, Purple & Pink lines)"
            case .harrisonRedLine: return "Harrison (Red Line)"
            case .clintonGreenPinklines: return "Clinton (Green & Pink lines)"
            case .kimballBrownLine: return "Kimball (Brown Line)"
            case .addisonBrownLine: return "Addison (Brown Line)"
            case .stateLakeBrownGreenOrangePinkPurplelines: return "State/Lake (Brown, Green, Orange, Pink & Purple lines)"
            case .ciceroGreenLine: return "Cicero (Green Line)"
            case .montroseBlueLine: return "Montrose (Blue Line)"
        }
    }
    
    var coords: String {
        switch self {
            case .ciceroPinkLine: return "(41.85182, -87.745336)"
            case .centralParkPinkLine: return "(41.853839, -87.714842)"
            case .halstedGreenLine: return "(41.778943, -87.644244)"
            case .cumberlandBlueLine: return "(41.984246, -87.838028)"
            case .racineBlueLine: return "(41.87592, -87.659458)"
            case .paulinaBrownLine: return "(41.943623, -87.670907)"
            case .eighteenthPinkLine: return "(41.857908, -87.669147)"
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return "(41.885737, -87.630886)"
            case .jeffersonParkBlueLine: return "(41.970634, -87.760892)"
            case .diverseyBrownPurplelines: return "(41.932732, -87.653131)"
            case .montroseBrownLine: return "(41.961756, -87.675047)"
            case .uICHalstedBlueLine: return "(41.875474, -87.649707)"
            case .thirtyFifthBronzevilleIITGreenLine: return "(41.831677, -87.625826)"
            case .fosterPurpleLine: return "(42.05416, -87.68356)"
            case .quincyWellsBrownOrangePurplePinklines: return "(41.878723, -87.63374)"
            case .southportBrownLine: return "(41.943744, -87.663619)"
            case .loyolaRedLine: return "(42.001073, -87.661061)"
            case .fortySeventhRedLine: return "(41.810318, -87.63094)"
            case .brynMawrRedLine: return "(41.983504, -87.65884)"
            case .harlemBlueLineForestParkBranch: return "(41.87349, -87.806961)"
            case .howardRedPurpleYellowlines: return "(42.019063, -87.672892)"
            case .kedzieGreenLine: return "(41.884321, -87.706155)"
            case .kingDriveGreenLine: return "(41.78013, -87.615546)"
            case .ashlandsixtyThirdGreenLine: return "(41.77886, -87.663766)"
            case .ninetyFifthDanRyanRedLine: return "(41.722377, -87.624342)"
            case .westernBlueLineOHareBranch: return "(41.916157, -87.687364)"
            case .armitageBrownPurplelines: return "(41.918217, -87.652644)"
            case .rooseveltRedOrangeGreenlines: return "(41.867368, -87.627402)"
            case .belmontRedBrownPurplelines: return "(41.939751, -87.65338)"
            case .fiftyFourthCermakPinkLine: return "(41.85177331, -87.75669201)"
            case .dempsterPurpleLine: return "(42.041655, -87.681602)"
            case .fullertonRedBrownPurplelines: return "(41.925051, -87.652866)"
            case .lawrenceRedLine: return "(41.969139, -87.658493)"
            case .illinoisMedicalDistrictBlueLine: return "(41.875706, -87.673932)"
            case .lakeRedLine: return "(41.884809, -87.627813)"
            case .seventyNinthRedLine: return "(41.750419, -87.625112)"
            case .austinGreenLine: return "(41.887293, -87.774135)"
            case .clintonBlueLine: return "(41.875539, -87.640984)"
            case .wellingtonBrownPurplelines: return "(41.936033, -87.653266)"
            case .oakParkGreenLine: return "(41.886988, -87.793783)"
            case .chicagoRedLine: return "(41.896671, -87.628176)"
            case .sedgwickBrownPurplelines: return "(41.910409, -87.639302)"
            case .addisonBlueLine: return "(41.94738, -87.71906)"
            case .jacksonBlueLine: return "(41.878183, -87.629296)"
            case .kedziePinkLine: return "(41.853964, -87.705408)"
            case .monroeBlueLine: return "(41.880703, -87.629378)"
            case .rockwellBrownLine: return "(41.966115, -87.6941)"
            case .damenPinkLine: return "(41.854517, -87.675975)"
            case .pulaskiBlueLine: return "(41.873797, -87.725663)"
            case .harlemLakeGreenLine: return "(41.886848, -87.803176)"
            case .washingtonWabashBrownGreenOrangePurplePinklines: return "(41.88322, -87.626189)"
            case .californiaGreenLine: return "(41.88422, -87.696234)"
            case .morseRedLine: return "(42.008362, -87.665909)"
            case .westernOrangeLine: return "(41.804546, -87.684019)"
            case .grandBlueLine: return "(41.891189, -87.647578)"
            case .divisionBlueLine: return "(41.903355, -87.666496)"
            case .pulaskiOrangeLine: return "(41.799756, -87.724493)"
            case .sheridanRedLine: return "(41.953775, -87.654929)"
            case .chicagoBlueLine: return "(41.896075, -87.655214)"
            case .merchandiseMartBrownPurplelines: return "(41.888969, -87.633924)"
            case .oHareBlueLine: return "(41.97766526, -87.90422307)"
            case .fortyThirdGreenLine: return "(41.816462, -87.619021)"
            case .soxthirtyFifthRedLine: return "(41.831191, -87.630636)"
            case .loganSquareBlueLine: return "(41.929728, -87.708541)"
            case .damenBlueLine: return "(41.909744, -87.677437)"
            case .ashlandGreenPinklines: return "(41.885269, -87.666969)"
            case .irvingParkBlueLine: return "(41.952925, -87.729229)"
            case .wilsonRedPurplelines: return "(41.964273, -87.657588)"
            case .cermakChinatownRedLine: return "(41.853206, -87.630968)"
            case .laSalleBlueLine: return "(41.875568, -87.631722)"
            case .thorndaleRedLine: return "(41.990259, -87.659076)"
            case .granvilleRedLine: return "(41.993664, -87.659202)"
            case .addisonRedLine: return "(41.947428, -87.653626)"
            case .centralGreenLine: return "(41.887389, -87.76565)"
            case .conservatoryGreenLine: return "(41.884904, -87.716523)"
            case .noyesPurpleLine: return "(42.058282, -87.683337)"
            case .fortySeventhGreenLine: return "(41.809209, -87.618826)"
            case .jarvisRedLine: return "(42.015876, -87.669092)"
            case .halstedOrangeLine: return "(41.84678, -87.648088)"
            case .davisPurpleLine: return "(42.04771, -87.683543)"
            case .chicagoBrownPurplelines: return "(41.89681, -87.635924)"
            case .monroeRedLine: return "(41.880745, -87.627696)"
            case .kedzieBrownLine: return "(41.965996, -87.708821)"
            case .fiftyFirstGreenLine: return "(41.80209, -87.618487)"
            case .garfieldGreenLine: return "(41.795172, -87.618327)"
            case .ashlandOrangeLine: return "(41.839234, -87.665317)"
            case .grandRedLine: return "(41.891665, -87.628021)"
            case .cermakMcCormickPlaceGreenLine: return "(41.853115, -87.626402)"
            case .polkPinkLine: return "(41.871551, -87.66953)"
            case .damenBrownLine: return "(41.966286, -87.678639)"
            case .pulaskiPinkLine: return "(41.853732, -87.724311)"
            case .thirtyFifthArcherOrangeLine: return "(41.829353, -87.680622)"
            case .southBoulevardPurpleLine: return "(42.027612, -87.678329)"
            case .mainPurpleLine: return "(42.033456, -87.679538)"
            case .jacksonRedLine: return "(41.878153, -87.627596)"
            case .argyleRedLine: return "(41.973453, -87.65853)"
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return "(41.876862, -87.628196)"
            case .austinBlueLine: return "(41.870851, -87.776812)"
            case .washingtonBlueLine: return "(41.883164, -87.62944)"
            case .kedzieHomanBlueLine: return "(41.874341, -87.70604)"
            case .sixtyThirdRedLine: return "(41.780536, -87.630952)"
            case .kedzieOrangeLine: return "(41.804236, -87.704406)"
            case .laramieGreenLine: return "(41.887163, -87.754986)"
            case .eightySeventhRedLine: return "(41.735372, -87.624717)"
            case .westernBlueLineForestParkBranch: return "(41.875478, -87.688436)"
            case .westernBrownLine: return "(41.966163, -87.688502)"
            case .californiaBlueLine: return "(41.921939, -87.69689)"
            case .forestParkBlueLine: return "(41.874257, -87.817318)"
            case .rosemontBlueLine: return "(41.983507, -87.859388)"
            case .adamsWabashBrownGreenOrangePinkPurplelines: return "(41.879507, -87.626037)"
            case .berwynRedLine: return "(41.977984, -87.658668)"
            case .harlemBlueLineOHareBranch: return "(41.98227, -87.8089)"
            case .belmontBlueLine: return "(41.938132, -87.712359)"
            case .clarkDivisionRedLine: return "(41.90392, -87.631412)"
            case .indianaGreenLine: return "(41.821732, -87.621371)"
            case .kostnerPinkLine: return "(41.853751, -87.733258)"
            case .dempsterSkokieYellowLine: return "(42.038951, -87.751919)"
            case .morganGreenPinklines: return "(41.885586, -87.652193)"
            case .ciceroBlueLine: return "(41.871574, -87.745154)"
            case .oaktonSkokieYellowLine: return "(42.02624348, -87.74722084)"
            case .cottageGroveGreenLine: return "(41.780309, -87.605857)"
            case .midwayOrangeLine: return "(41.78661, -87.737875)"
            case .centralPurpleLine: return "(42.063987, -87.685617)"
            case .pulaskiGreenLine: return "(41.885412, -87.725404)"
            case .ridgelandGreenLine: return "(41.887159, -87.783661)"
            case .lindenPurpleLine: return "(42.073153, -87.69073)"
            case .garfieldRedLine: return "(41.79542, -87.631157)"
            case .northClybournRedLine: return "(41.910655, -87.649177)"
            case .oakParkBlueLine: return "(41.872108, -87.791602)"
            case .irvingParkBrownLine: return "(41.954521, -87.674868)"
            case .franciscoBrownLine: return "(41.966046, -87.701644)"
            case .laSalleVanBurenBrownOrangePurplePinklines: return "(41.8768, -87.631739)"
            case .californiaPinkLine: return "(41.854109, -87.694774)"
            case .westernPinkLine: return "(41.854225, -87.685129)"
            case .sixtyNinthRedLine: return "(41.768367, -87.625724)"
            case .washingtonWellsBrownOrangePurplePinklines: return "(41.882695, -87.63378)"
            case .harrisonRedLine: return "(41.874039, -87.627479)"
            case .clintonGreenPinklines: return "(41.885678, -87.641782)"
            case .kimballBrownLine: return "(41.967901, -87.713065)"
            case .addisonBrownLine: return "(41.947028, -87.674642)"
            case .stateLakeBrownGreenOrangePinkPurplelines: return "(41.88574, -87.627835)"
            case .ciceroGreenLine: return "(41.886519, -87.744698)"
            case .montroseBlueLine: return "(41.961539, -87.743574)"
        }
    }
    
    var latitude: Double {
        switch self {
            case .ciceroPinkLine: return 41.85182
            case .centralParkPinkLine: return 41.853839
            case .halstedGreenLine: return 41.778943
            case .cumberlandBlueLine: return 41.984246
            case .racineBlueLine: return 41.87592
            case .paulinaBrownLine: return 41.943623
            case .eighteenthPinkLine: return 41.857908
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return 41.885737
            case .jeffersonParkBlueLine: return 41.970634
            case .diverseyBrownPurplelines: return 41.932732
            case .montroseBrownLine: return 41.961756
            case .uICHalstedBlueLine: return 41.875474
            case .thirtyFifthBronzevilleIITGreenLine: return 41.831677
            case .fosterPurpleLine: return 42.05416
            case .quincyWellsBrownOrangePurplePinklines: return 41.878723
            case .southportBrownLine: return 41.943744
            case .loyolaRedLine: return 42.001073
            case .fortySeventhRedLine: return 41.810318
            case .brynMawrRedLine: return 41.983504
            case .harlemBlueLineForestParkBranch: return 41.87349
            case .howardRedPurpleYellowlines: return 42.019063
            case .kedzieGreenLine: return 41.884321
            case .kingDriveGreenLine: return 41.78013
            case .ashlandsixtyThirdGreenLine: return 41.77886
            case .ninetyFifthDanRyanRedLine: return 41.722377
            case .westernBlueLineOHareBranch: return 41.916157
            case .armitageBrownPurplelines: return 41.918217
            case .rooseveltRedOrangeGreenlines: return 41.867368
            case .belmontRedBrownPurplelines: return 41.939751
            case .fiftyFourthCermakPinkLine: return 41.85177331
            case .dempsterPurpleLine: return 42.041655
            case .fullertonRedBrownPurplelines: return 41.925051
            case .lawrenceRedLine: return 41.969139
            case .illinoisMedicalDistrictBlueLine: return 41.875706
            case .lakeRedLine: return 41.884809
            case .seventyNinthRedLine: return 41.750419
            case .austinGreenLine: return 41.887293
            case .clintonBlueLine: return 41.875539
            case .wellingtonBrownPurplelines: return 41.936033
            case .oakParkGreenLine: return 41.886988
            case .chicagoRedLine: return 41.896671
            case .sedgwickBrownPurplelines: return 41.910409
            case .addisonBlueLine: return 41.94738
            case .jacksonBlueLine: return 41.878183
            case .kedziePinkLine: return 41.853964
            case .monroeBlueLine: return 41.880703
            case .rockwellBrownLine: return 41.966115
            case .damenPinkLine: return 41.854517
            case .pulaskiBlueLine: return 41.873797
            case .harlemLakeGreenLine: return 41.886848
            case .washingtonWabashBrownGreenOrangePurplePinklines: return 41.88322
            case .californiaGreenLine: return 41.88422
            case .morseRedLine: return 42.008362
            case .westernOrangeLine: return 41.804546
            case .grandBlueLine: return 41.891189
            case .divisionBlueLine: return 41.903355
            case .pulaskiOrangeLine: return 41.799756
            case .sheridanRedLine: return 41.953775
            case .chicagoBlueLine: return 41.896075
            case .merchandiseMartBrownPurplelines: return 41.888969
            case .oHareBlueLine: return 41.97766526
            case .fortyThirdGreenLine: return 41.816462
            case .soxthirtyFifthRedLine: return 41.831191
            case .loganSquareBlueLine: return 41.929728
            case .damenBlueLine: return 41.909744
            case .ashlandGreenPinklines: return 41.885269
            case .irvingParkBlueLine: return 41.952925
            case .wilsonRedPurplelines: return 41.964273
            case .cermakChinatownRedLine: return 41.853206
            case .laSalleBlueLine: return 41.875568
            case .thorndaleRedLine: return 41.990259
            case .granvilleRedLine: return 41.993664
            case .addisonRedLine: return 41.947428
            case .centralGreenLine: return 41.887389
            case .conservatoryGreenLine: return 41.884904
            case .noyesPurpleLine: return 42.058282
            case .fortySeventhGreenLine: return 41.809209
            case .jarvisRedLine: return 42.015876
            case .halstedOrangeLine: return 41.84678
            case .davisPurpleLine: return 42.04771
            case .chicagoBrownPurplelines: return 41.89681
            case .monroeRedLine: return 41.880745
            case .kedzieBrownLine: return 41.965996
            case .fiftyFirstGreenLine: return 41.80209
            case .garfieldGreenLine: return 41.795172
            case .ashlandOrangeLine: return 41.839234
            case .grandRedLine: return 41.891665
            case .cermakMcCormickPlaceGreenLine: return 41.853115
            case .polkPinkLine: return 41.871551
            case .damenBrownLine: return 41.966286
            case .pulaskiPinkLine: return 41.853732
            case .thirtyFifthArcherOrangeLine: return 41.829353
            case .southBoulevardPurpleLine: return 42.027612
            case .mainPurpleLine: return 42.033456
            case .jacksonRedLine: return 41.878153
            case .argyleRedLine: return 41.973453
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return 41.876862
            case .austinBlueLine: return 41.870851
            case .washingtonBlueLine: return 41.883164
            case .kedzieHomanBlueLine: return 41.874341
            case .sixtyThirdRedLine: return 41.780536
            case .kedzieOrangeLine: return 41.804236
            case .laramieGreenLine: return 41.887163
            case .eightySeventhRedLine: return 41.735372
            case .westernBlueLineForestParkBranch: return 41.875478
            case .westernBrownLine: return 41.966163
            case .californiaBlueLine: return 41.921939
            case .forestParkBlueLine: return 41.874257
            case .rosemontBlueLine: return 41.983507
            case .adamsWabashBrownGreenOrangePinkPurplelines: return 41.879507
            case .berwynRedLine: return 41.977984
            case .harlemBlueLineOHareBranch: return 41.98227
            case .belmontBlueLine: return 41.938132
            case .clarkDivisionRedLine: return 41.90392
            case .indianaGreenLine: return 41.821732
            case .kostnerPinkLine: return 41.853751
            case .dempsterSkokieYellowLine: return 42.038951
            case .morganGreenPinklines: return 41.885586
            case .ciceroBlueLine: return 41.871574
            case .oaktonSkokieYellowLine: return 42.02624348
            case .cottageGroveGreenLine: return 41.780309
            case .midwayOrangeLine: return 41.78661
            case .centralPurpleLine: return 42.063987
            case .pulaskiGreenLine: return 41.885412
            case .ridgelandGreenLine: return 41.887159
            case .lindenPurpleLine: return 42.073153
            case .garfieldRedLine: return 41.79542
            case .northClybournRedLine: return 41.910655
            case .oakParkBlueLine: return 41.872108
            case .irvingParkBrownLine: return 41.954521
            case .franciscoBrownLine: return 41.966046
            case .laSalleVanBurenBrownOrangePurplePinklines: return 41.8768
            case .californiaPinkLine: return 41.854109
            case .westernPinkLine: return 41.854225
            case .sixtyNinthRedLine: return 41.768367
            case .washingtonWellsBrownOrangePurplePinklines: return 41.882695
            case .harrisonRedLine: return 41.874039
            case .clintonGreenPinklines: return 41.885678
            case .kimballBrownLine: return 41.967901
            case .addisonBrownLine: return 41.947028
            case .stateLakeBrownGreenOrangePinkPurplelines: return 41.88574
            case .ciceroGreenLine: return 41.886519
            case .montroseBlueLine: return 41.961539
        }
    }
    
    var longitude: Double {
        switch self {
            case .ciceroPinkLine: return -87.745336
            case .centralParkPinkLine: return -87.714842
            case .halstedGreenLine: return -87.644244
            case .cumberlandBlueLine: return -87.838028
            case .racineBlueLine: return -87.659458
            case .paulinaBrownLine: return -87.670907
            case .eighteenthPinkLine: return -87.669147
            case .clarkLakeBlueBrownGreenOrangePurplePinklines: return -87.630886
            case .jeffersonParkBlueLine: return -87.760892
            case .diverseyBrownPurplelines: return -87.653131
            case .montroseBrownLine: return -87.675047
            case .uICHalstedBlueLine: return -87.649707
            case .thirtyFifthBronzevilleIITGreenLine: return -87.625826
            case .fosterPurpleLine: return -87.68356
            case .quincyWellsBrownOrangePurplePinklines: return -87.63374
            case .southportBrownLine: return -87.663619
            case .loyolaRedLine: return -87.661061
            case .fortySeventhRedLine: return -87.63094
            case .brynMawrRedLine: return -87.65884
            case .harlemBlueLineForestParkBranch: return -87.806961
            case .howardRedPurpleYellowlines: return -87.672892
            case .kedzieGreenLine: return -87.706155
            case .kingDriveGreenLine: return -87.615546
            case .ashlandsixtyThirdGreenLine: return -87.663766
            case .ninetyFifthDanRyanRedLine: return -87.624342
            case .westernBlueLineOHareBranch: return -87.687364
            case .armitageBrownPurplelines: return -87.652644
            case .rooseveltRedOrangeGreenlines: return -87.627402
            case .belmontRedBrownPurplelines: return -87.65338
            case .fiftyFourthCermakPinkLine: return -87.75669201
            case .dempsterPurpleLine: return -87.681602
            case .fullertonRedBrownPurplelines: return -87.652866
            case .lawrenceRedLine: return -87.658493
            case .illinoisMedicalDistrictBlueLine: return -87.673932
            case .lakeRedLine: return -87.627813
            case .seventyNinthRedLine: return -87.625112
            case .austinGreenLine: return -87.774135
            case .clintonBlueLine: return -87.640984
            case .wellingtonBrownPurplelines: return -87.653266
            case .oakParkGreenLine: return -87.793783
            case .chicagoRedLine: return -87.628176
            case .sedgwickBrownPurplelines: return -87.639302
            case .addisonBlueLine: return -87.71906
            case .jacksonBlueLine: return -87.629296
            case .kedziePinkLine: return -87.705408
            case .monroeBlueLine: return -87.629378
            case .rockwellBrownLine: return -87.6941
            case .damenPinkLine: return -87.675975
            case .pulaskiBlueLine: return -87.725663
            case .harlemLakeGreenLine: return -87.803176
            case .washingtonWabashBrownGreenOrangePurplePinklines: return -87.626189
            case .californiaGreenLine: return -87.696234
            case .morseRedLine: return -87.665909
            case .westernOrangeLine: return -87.684019
            case .grandBlueLine: return -87.647578
            case .divisionBlueLine: return -87.666496
            case .pulaskiOrangeLine: return -87.724493
            case .sheridanRedLine: return -87.654929
            case .chicagoBlueLine: return -87.655214
            case .merchandiseMartBrownPurplelines: return -87.633924
            case .oHareBlueLine: return -87.90422307
            case .fortyThirdGreenLine: return -87.619021
            case .soxthirtyFifthRedLine: return -87.630636
            case .loganSquareBlueLine: return -87.708541
            case .damenBlueLine: return -87.677437
            case .ashlandGreenPinklines: return -87.666969
            case .irvingParkBlueLine: return -87.729229
            case .wilsonRedPurplelines: return -87.657588
            case .cermakChinatownRedLine: return -87.630968
            case .laSalleBlueLine: return -87.631722
            case .thorndaleRedLine: return -87.659076
            case .granvilleRedLine: return -87.659202
            case .addisonRedLine: return -87.653626
            case .centralGreenLine: return -87.76565
            case .conservatoryGreenLine: return -87.716523
            case .noyesPurpleLine: return -87.683337
            case .fortySeventhGreenLine: return -87.618826
            case .jarvisRedLine: return -87.669092
            case .halstedOrangeLine: return -87.648088
            case .davisPurpleLine: return -87.683543
            case .chicagoBrownPurplelines: return -87.635924
            case .monroeRedLine: return -87.627696
            case .kedzieBrownLine: return -87.708821
            case .fiftyFirstGreenLine: return -87.618487
            case .garfieldGreenLine: return -87.618327
            case .ashlandOrangeLine: return -87.665317
            case .grandRedLine: return -87.628021
            case .cermakMcCormickPlaceGreenLine: return -87.626402
            case .polkPinkLine: return -87.66953
            case .damenBrownLine: return -87.678639
            case .pulaskiPinkLine: return -87.724311
            case .thirtyFifthArcherOrangeLine: return -87.680622
            case .southBoulevardPurpleLine: return -87.678329
            case .mainPurpleLine: return -87.679538
            case .jacksonRedLine: return -87.627596
            case .argyleRedLine: return -87.65853
            case .haroldWashingtonLibraryStateVanBurenBrownOrangePurplePinklines: return -87.628196
            case .austinBlueLine: return -87.776812
            case .washingtonBlueLine: return -87.62944
            case .kedzieHomanBlueLine: return -87.70604
            case .sixtyThirdRedLine: return -87.630952
            case .kedzieOrangeLine: return -87.704406
            case .laramieGreenLine: return -87.754986
            case .eightySeventhRedLine: return -87.624717
            case .westernBlueLineForestParkBranch: return -87.688436
            case .westernBrownLine: return -87.688502
            case .californiaBlueLine: return -87.69689
            case .forestParkBlueLine: return -87.817318
            case .rosemontBlueLine: return -87.859388
            case .adamsWabashBrownGreenOrangePinkPurplelines: return -87.626037
            case .berwynRedLine: return -87.658668
            case .harlemBlueLineOHareBranch: return -87.8089
            case .belmontBlueLine: return -87.712359
            case .clarkDivisionRedLine: return -87.631412
            case .indianaGreenLine: return -87.621371
            case .kostnerPinkLine: return -87.733258
            case .dempsterSkokieYellowLine: return -87.751919
            case .morganGreenPinklines: return -87.652193
            case .ciceroBlueLine: return -87.745154
            case .oaktonSkokieYellowLine: return -87.74722084
            case .cottageGroveGreenLine: return -87.605857
            case .midwayOrangeLine: return -87.737875
            case .centralPurpleLine: return -87.685617
            case .pulaskiGreenLine: return -87.725404
            case .ridgelandGreenLine: return -87.783661
            case .lindenPurpleLine: return -87.69073
            case .garfieldRedLine: return -87.631157
            case .northClybournRedLine: return -87.649177
            case .oakParkBlueLine: return -87.791602
            case .irvingParkBrownLine: return -87.674868
            case .franciscoBrownLine: return -87.701644
            case .laSalleVanBurenBrownOrangePurplePinklines: return -87.631739
            case .californiaPinkLine: return -87.694774
            case .westernPinkLine: return -87.685129
            case .sixtyNinthRedLine: return -87.625724
            case .washingtonWellsBrownOrangePurplePinklines: return -87.63378
            case .harrisonRedLine: return -87.627479
            case .clintonGreenPinklines: return -87.641782
            case .kimballBrownLine: return -87.713065
            case .addisonBrownLine: return -87.674642
            case .stateLakeBrownGreenOrangePinkPurplelines: return -87.627835
            case .ciceroGreenLine: return -87.744698
            case .montroseBlueLine: return -87.743574
        }
    }
}
