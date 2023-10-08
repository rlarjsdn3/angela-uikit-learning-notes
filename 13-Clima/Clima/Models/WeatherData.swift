//
//  WeatherData.swift
//  Clima
//
//  Created by 김건우 on 10/7/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

typealias Codable = Decodable & Encodable

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
}

struct Main: Codable {
    let temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}

struct Weather: Codable {
    let id: Int
}


