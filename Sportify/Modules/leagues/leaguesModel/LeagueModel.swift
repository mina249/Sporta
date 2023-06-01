//
//  LeagueModel.swift
//  Sportify
//
//  Created by ME on 23/05/2023.
//

import Foundation
class LeaguesModel: Codable{
    let success:Int
    let result:[League]
    
}

class League: Codable{
    let league_name:String
    let league_logo:String?
    let league_key:Int
}


