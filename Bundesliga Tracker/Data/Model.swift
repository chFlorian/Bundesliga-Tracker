//
//  Gameday.swift
//  Bundesliga Tracker
//
//  Created by florian schweizer on 02.07.21.
//

import Foundation

struct Match: Codable {
    struct Group: Codable {
        let groupName: String
        let groupOrderID: Int
        let groupID: Int
    }

    struct Team1: Codable {
        let teamID: Int
        let teamName: String
        let shortName: String
        let teamIconURL: String

        private enum CodingKeys: String, CodingKey {
            case teamID = "teamId"
            case teamName
            case shortName
            case teamIconURL = "teamIconUrl"
        }
    }

    struct Team2: Codable {
        let teamID: Int
        let teamName: String
        let shortName: String
        let teamIconURL: String

        private enum CodingKeys: String, CodingKey {
            case teamID = "teamId"
            case teamName
            case shortName
            case teamIconURL = "teamIconUrl"
        }
    }

    struct MatchResult: Codable {
        let resultID: Int
        let resultName: String
        let pointsTeam1: Int
        let pointsTeam2: Int
        let resultOrderID: Int
        let resultTypeID: Int
        let resultDescription: String
    }

    struct Goal: Codable {
        let goalID: Int
        let scoreTeam1: Int
        let scoreTeam2: Int
        let matchMinute: Int
        let goalGetterID: Int
        let goalGetterName: String
        let isPenalty: Bool
        let isOwnGoal: Bool
        let isOvertime: Bool
    }

    let matchID: Int
    let matchDateTime: String
    let timeZoneID: String
    let leagueID: Int
    let leagueName: String
    let leagueSeason: Int
    let leagueShortcut: String
    let group: Group
    let team1: Team1
    let team2: Team2
    let lastUpdateDateTime: String
    let matchIsFinished: Bool
    let matchResults: [MatchResult]
    let goals: [Goal]

    private enum CodingKeys: String, CodingKey {
        case matchID
        case matchDateTime
        case timeZoneID
        case leagueID = "leagueId"
        case leagueName
        case leagueSeason
        case leagueShortcut
        case group
        case team1
        case team2
        case lastUpdateDateTime
        case matchIsFinished
        case matchResults
        case goals
    }
}
