//
//  FlightModel.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 06/08/24.
//

import Foundation
 
struct FlightModel: Codable,Identifiable {
    enum CodingKeys: CodingKey{
        case flightNumber
        case departureCity
        case arrivalCity
        
    }
    var id = UUID()
    let flightNumber : String
    let departureCity : String
    let arrivalCity : String
}
