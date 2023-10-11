//
//  model.swift
//  FavoriteAthlete
//
//  Created by Dax Gerber on 10/11/23.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var league: String
    var team: String
    
    var description: String {
        return "age: \(age), league: \(league), team: \(team)"
    }
}
