//
//  APIService.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 02.07.21.
//

import Foundation

enum APIService {
    private static let baseUrl = "https://api.openligadb.de/getmatchdata/bl1/2020/"
    
    static func fetchGameday(_ day: Int) async throws -> [Match] {
        guard let url = URL(string: baseUrl + String(day)) else {
            fatalError()
        }
        
        let result = try await URLSession.shared.data(from: url)
        
        let (data, _) = result
        let gameday = try JSONDecoder().decode([Match].self, from: data)
        
        return gameday
    }
}
