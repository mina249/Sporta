//
//  TeamModel.swift
//  Sportify
//
//  Created by ME on 24/05/2023.
//

import Foundation
class TeamModel:Codable{
    let success:Int?
    let result:[TeamData]?
}
class TeamData:Codable{
    let team_key:Int?
    let team_name:String?
    let team_logo:String?
    let players:[Player]?
    let coaches:[Coach]?
   
}
class Player:Codable{
    let player_name:String?
    let player_image:String?
}
class Coach:Codable{
    let coach_name:String?
}

struct Team{
    let name:String
    let logo:String
    let id:Int
}
