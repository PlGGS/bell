//
//  Train.swift
//  Bell
//
//  Created by Blake Boris on 4/27/23.
//

import Foundation

class Train: Codable, Identifiable {
    let nextParentTerminalID: String?; ///Parent terminal ids correspond to the generic internal name for a terminal (mapid)
    let nextDirectedTerminalID: String?; ///Directed terminal ids correspond to the unique, internal, line-specific terminal identifiers
    let nextParentTerminalShortName: String?;
    let destinationString: String?; ///Final destination of the train (Ex: Howard)
    let runNumber: String?; ///Ex: 420
    let lineName: String?; ///Ex: "Red" "Brn"
    let destinationDirectedTerminalID: String?; ///final destination terminal id
    let destinationTerminalShortName: String?; ///final destination terminal name
    let routeDirection: String?; ///Ex: 1 (northbound) or 5 (southbound)
    let timeOfPrediction: String?;
    let predictedArrivalTime: String?;
    let isApproaching: String?;
    let isScheduled: String?; ///THIS MEANS PREDICTION IS NOT LIVE
    let isDelayed: String?;
    let hasScheduleFault: String?; ///Means that the train didn't leave when scheduled. If the train also isScheduled, this indicates that it might not leave on time
    let flags: String?; ///Not currently in use (always returns null)
    let latitude: String?;
    let longitude: String?;
    let heading: String?; ///Direction N, E, S, W in degrees 0 through 359 (null if haven't left yet)

    var annotation: TrainAnnotation?
    var etas: [Train]? //This is of type Train, but that's just to keep things simple since the follow api response is almost identical to the arrivals api
    
    enum CodingKeys: String, CodingKey {
        case nextParentTerminalID = "staId"
        case nextDirectedTerminalID = "stpId"
        case nextParentTerminalShortName = "staNm"
        case destinationString = "stpDe"
        case runNumber = "rn"
        case lineName = "rt"
        case destinationDirectedTerminalID = "destSt"
        case destinationTerminalShortName = "destNm"
        case routeDirection = "trDr"
        case timeOfPrediction = "prdt"
        case predictedArrivalTime = "arrT"
        case isApproaching = "isApp"
        case isScheduled = "isSch"
        case isDelayed = "isDly"
        case hasScheduleFault = "isFlt"
        case flags = "flags"
        case latitude = "lat"
        case longitude = "lon"
        case heading = "heading"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nextParentTerminalID = try? container.decodeIfPresent(String.self, forKey: .nextParentTerminalID)
        nextDirectedTerminalID = try? container.decodeIfPresent(String.self, forKey: .nextDirectedTerminalID)
        nextParentTerminalShortName = try? container.decodeIfPresent(String.self, forKey: .nextParentTerminalShortName)
        destinationString = try? container.decodeIfPresent(String.self, forKey: .destinationString)
        runNumber = try? container.decodeIfPresent(String.self, forKey: .runNumber)
        lineName = try? container.decodeIfPresent(String.self, forKey: .lineName)
        destinationDirectedTerminalID = try? container.decodeIfPresent(String.self, forKey: .destinationDirectedTerminalID)
        destinationTerminalShortName = try? container.decodeIfPresent(String.self, forKey: .destinationTerminalShortName)
        routeDirection = try? container.decodeIfPresent(String.self, forKey: .routeDirection)
        timeOfPrediction = try? container.decodeIfPresent(String.self, forKey: .timeOfPrediction)
        predictedArrivalTime = try? container.decodeIfPresent(String.self, forKey: .predictedArrivalTime)
        isApproaching = try? container.decodeIfPresent(String.self, forKey: .isApproaching)
        isScheduled = try? container.decodeIfPresent(String.self, forKey: .isScheduled)
        isDelayed = try? container.decodeIfPresent(String.self, forKey: .isDelayed)
        hasScheduleFault = try? container.decodeIfPresent(String.self, forKey: .hasScheduleFault)
        flags = try? container.decodeIfPresent(String.self, forKey: .flags)
        latitude = try? container.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try? container.decodeIfPresent(String.self, forKey: .longitude)
        heading = try? container.decodeIfPresent(String.self, forKey: .heading)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nextParentTerminalID, forKey: .nextParentTerminalID)
        try container.encode(nextDirectedTerminalID, forKey: .nextDirectedTerminalID)
        try container.encode(nextParentTerminalShortName, forKey: .nextParentTerminalShortName)
        try container.encode(destinationString, forKey: .destinationString)
        try container.encode(runNumber, forKey: .runNumber)
        try container.encode(lineName, forKey: .lineName)
        try container.encode(destinationDirectedTerminalID, forKey: .destinationDirectedTerminalID)
        try container.encode(destinationTerminalShortName, forKey: .destinationTerminalShortName)
        try container.encode(routeDirection, forKey: .routeDirection)
        try container.encode(timeOfPrediction, forKey: .timeOfPrediction)
        try container.encode(predictedArrivalTime, forKey: .predictedArrivalTime)
        try container.encode(isApproaching, forKey: .isApproaching)
        try container.encode(isScheduled, forKey: .isScheduled)
        try container.encode(isDelayed, forKey: .isDelayed)
        try container.encode(hasScheduleFault, forKey: .hasScheduleFault)
        try container.encode(flags, forKey: .flags)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(heading, forKey: .heading)
    }
    
    func getDirection() -> String {
        switch Int(heading ?? "-1")! {
            case 0...22, 338...360:
                return "North: \(destinationString!)"
            case 23...67:
                return "Northeast: \(destinationString!)"
            case 68...112:
                return "East: \(destinationString!)"
            case 113...157:
                return "Southeast: \(destinationString!)"
            case 158...202:
                return "South: \(destinationString!)"
            case 203...247:
                return "Southwest: \(destinationString!)"
            case 248...292:
                return "West: \(destinationString!)"
            case 293...337:
                return "Northwest: \(destinationString!)"
            default:
            return (isScheduled! == "1") ? "Scheduled: \(destinationString!)" : destinationString!
        }
    }
    
    func getTimeTillArrival() -> String {
        if isApproaching == "1" {
            return "Due"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let time1 = dateFormatter.date(from: timeOfPrediction!),
              let time2 = dateFormatter.date(from: predictedArrivalTime!) else {
            fatalError("Invalid date format")
        }
        
        let diffSeconds = time2.timeIntervalSince(time1)
        let diffMinutes = diffSeconds / 60
        
        return String(format: "%.0f", diffMinutes)
    }
}
