//
//  FootbalModel.swift
//  Sportify
//
//  Created by ME on 24/05/2023.
//

import Foundation
class EventDetailsModel:Codable{
    let success:Int
    let result:[EventResponse]?
}
class EventResponse:Codable{
    let event_time:String?
    let event_date:String?
    let event_away_team:String?
    let event_home_team:String?
    let event_final_result:String?
    
    //football
    let away_team_logo:String?
    let home_team_logo:String?
    
    //basket // cricket
    let event_away_team_logo:String?
    let event_home_team_logo:String?
    
   //cricket
    let event_date_start:String?
    let event_date_stop:String?
    var event_away_final_result:String?
    
    // tennis
    let event_first_player:String?
    let event_second_player:String?
    let event_first_player_logo:String?
    let event_second_player_logo:String?
    var event_game_result:String?
}


struct Event{
    let firstTeamName:String
    let SecTeamName:String
    let date:String
    let time:String
    let firstTeamLogo:String
    let secTeamLogo:String
    var finalResult:String = "VS"
}

