//
//  HomeView.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 02.07.21.
//
// <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

import SwiftUI

struct HomeView: View {
    @StateObject private var model = HomeViewModel()
    @State var animated = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    HStack(spacing: 16) {
                        TextField("Gameday", value: $model.search, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                        Button {
                            model.load(day: model.search)
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    .padding(.vertical)
                    .listRowSeparator(.hidden, edges: .top)
                    
                    ForEach(model.matches, id:\.matchID) { match in
                        NavigationLink(destination: MatchDetailView(match: match)) {
                            MatchPreviewView(match: match)
                        }
                    }
                }
                .listStyle(.inset)
                .navigationTitle("1. Bundesliga")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("bundesliga")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                }
                .task {
                    withAnimation {
                        animated = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        model.load(day: 8)
                    }
                }
                
                if !model.done {
                    animatedBall
                }
            }
        }
    }
    
    private var animatedBall: some View {
        Capsule()
            .frame(width: animated ? 40 : 80, height: 16)
            .animation(.linear(duration: 0.4).repeatForever(), value: animated)
            .opacity(0.1)
            .overlay(
                Image("soccer-ball")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(animated ? 360 : 0))
                    .offset(x: 0, y: animated ? -150 : -50)
                    .animation(.linear(duration: 0.4).repeatForever(), value: animated)
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
