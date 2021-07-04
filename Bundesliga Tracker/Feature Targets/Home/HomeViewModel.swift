//
//  HomeViewModel.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 02.07.21.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var search = 5
    @Published var matches: [Match] = []
    
    func load(day: Int) {
        async {
            do {
                let matches = try await APIService
                    .fetchGameday(day)
                
                DispatchQueue.main.async {
                    self.matches = matches
                }
            } catch {
                print(error)
            }
        }
    }
}
