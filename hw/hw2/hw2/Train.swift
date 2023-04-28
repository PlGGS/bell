//
//  Train.swift
//  hw2
//
//  Created by Blake Boris on 4/27/23.
//

class Train: Codable {
    let nextParentTerminalID: String; ///Parent terminal ids correspond to the generic internal name for a terminal
    let nextDirectedTerminalID: String; ///Directed terminal ids correspond to the unique, internal, line-specific terminal identifiers
    let nextParentTerminalShortName: String;
    let destinationString: String; ///Final destination of the train (Ex: Howard)
    let runNumber: String; ///Ex: 420
    let lineName: String; ///Ex: "Red" "Brn"
    let destinationDirectedTerminalID: String;
    let destinationTerminalShortName: String;
    let routeDirection: String; ///Ex: 1 (northbound) or 5 (southbound)
    let timeOfPrediction: String;
    let predictedArrivalTime: String;
    let isApproaching: String;
    let isScheduled: String; ///THIS MEANS PREDICTION IS NOT LIVE
    let isDelayed: String;
    let hasScheduleFault: String; ///Means that the train didn't leave when scheduled. If the train also isScheduled, this indicates that it might not leave on time
    let flags: String?; ///Not currently in use (always returns null)
    let latitude: String;
    let longitude: String;
    let heading: String?; ///Direction N, E, S, W in degrees 0 through 359 (null if haven't left yet)
    
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
        nextParentTerminalID = try container.decode(String.self, forKey: .nextParentTerminalID)
        nextDirectedTerminalID = try container.decode(String.self, forKey: .nextDirectedTerminalID)
        nextParentTerminalShortName = try container.decode(String.self, forKey: .nextParentTerminalShortName)
        destinationString = try container.decode(String.self, forKey: .destinationString)
        runNumber = try container.decode(String.self, forKey: .runNumber)
        lineName = try container.decode(String.self, forKey: .lineName)
        destinationDirectedTerminalID = try container.decode(String.self, forKey: .destinationDirectedTerminalID)
        destinationTerminalShortName = try container.decode(String.self, forKey: .destinationTerminalShortName)
        routeDirection = try container.decode(String.self, forKey: .routeDirection)
        timeOfPrediction = try container.decode(String.self, forKey: .timeOfPrediction)
        predictedArrivalTime = try container.decode(String.self, forKey: .predictedArrivalTime)
        isApproaching = try container.decode(String.self, forKey: .isApproaching)
        isScheduled = try container.decode(String.self, forKey: .isScheduled)
        isDelayed = try container.decode(String.self, forKey: .isDelayed)
        hasScheduleFault = try container.decode(String.self, forKey: .hasScheduleFault)
        if let flags = try? container.decodeIfPresent(String.self, forKey: .flags) {
            self.flags = flags
        } else {
            self.flags = nil
        }
        latitude = try container.decode(String.self, forKey: .latitude)
        longitude = try container.decode(String.self, forKey: .longitude)
        if let heading = try? container.decodeIfPresent(String.self, forKey: .heading) {
            self.heading = heading
        } else {
            self.heading = nil
        }
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
}
