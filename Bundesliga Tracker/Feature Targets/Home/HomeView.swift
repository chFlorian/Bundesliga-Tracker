//
//  HomeView.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 02.07.21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var model = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack(spacing: 16) {
                    TextField("Gameday", value: $model.search, formatter: NumberFormatter())
                        .textFieldStyle(.roundedBorder)
                    Button {
                        model.load(day: model.search)
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                .padding()
                
                ForEach(model.matches, id:\.matchID) { match in
                    VStack(spacing: 16) {
                        if !match.team1.teamIconURL.isEmpty && !match.team2.teamIconURL.isEmpty {
                            HStack {
                                AsyncImage(url: URL(string: match.team1.teamIconURL)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                }
                                
                                AsyncImage(url: URL(string: match.team2.teamIconURL)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                        
                        HStack {
                            Text(match.team1.teamName)
                            Text("vs.")
                            Text(match.team2.teamName)
                        }
                        .font(.subheadline)
                        HStack {
                            Text("\(match.goals.last?.scoreTeam1 ?? 0)")
                            Text(":")
                            Text("\(match.goals.last?.scoreTeam2 ?? 0)")
                        }
                        .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity)
                }
                .navigationTitle("1. Bundesliga")
            }
            .task {
                model.load(day: 8)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
