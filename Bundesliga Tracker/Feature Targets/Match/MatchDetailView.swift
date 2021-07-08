//
//  MatchDetailView.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 04.07.21.
//

import SwiftUI

struct MatchDetailView: View {
    var match: Match
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    VStack {
                        AsyncImage(url: URL(string: match.team1.teamIconURL)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                        } placeholder: {
                            Image("soccer-ball")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                        }
                        Text(match.team1.teamName)
                    }
                    
                    Text("vs")
                    
                    VStack {
                        AsyncImage(url: URL(string: match.team2.teamIconURL)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                        } placeholder: {
                            Image("soccer-ball")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                        }
                        Text(match.team2.teamName)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(.red.opacity(0.5))
                .cornerRadius(20)
                .padding()
                
                VStack(spacing: 10) {
                    Text("Endergebnis")
                        .font(.headline)
                    
                    HStack {
                        Text("\(match.goals.last?.scoreTeam1 ?? 0)")
                        Text(":")
                        Text("\(match.goals.last?.scoreTeam2 ?? 0)")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(.red.opacity(0.5))
                .cornerRadius(20)
                .padding()
                
                VStack(spacing: 10) {
                    Text("Tore")
                        .font(.headline)
                    
                    ForEach(match.goals, id: \.goalID) { goal in
                        
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
