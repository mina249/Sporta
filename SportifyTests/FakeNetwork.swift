//
//  FakeNetwork.swift
//  SportifyTests
//
//  Created by ME on 27/05/2023.
//

import Foundation
@testable import Sportify
class FakeNetowrk:NetworkProtocol{
    
    var shouldReturnError: Bool
    init(shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    enum ResponseWithError : Error {
        case responseError
    }
    let leagueJson = """
    {"success":1,"result":[{"league_key":4,"league_name":"UEFA Europa League","country_key":1,"country_name":"eurocups","league_logo":"https:apiv2.allsportsapi.comlogologo_leagues","country_logo":null}
    """
    let eventsJson = """
            "success:1",
            "result":[
            {"event_key":1220753,"event_date":"2023-06-10","event_time":"21:00","event_home_team":"Manchester City","home_team_key":80,"event_away_team":"Inter Milan","away_team_key":79,"event_halftime_result":"","event_final_result":"-","event_ft_result":"","event_penalty_result":"","event_status":"","country_name":"eurocups","league_name":"UEFA Champions League - Final","league_key":3,"league_round":"Final","league_season":"20222023","event_live":"0","event_stadium":"Atatu00fcrk Olimpiyat Stadu0131 (u0130stanbul)","event_referee":"S. Marciniak","home_team_logo":"https:apiv2.allsportsapi.comlogo80_manchester-city.jpg","away_team_logo":"https:apiv2.allsportsapi.comlogo79_inter-milan.jpg","event_country_key":1,"league_logo":"https:apiv2.allsportsapi.comlogologo_leagues3_uefa_champions_league.png","country_logo":null,"event_home_formation":"","event_away_formation":"","fk_stage_key":7,"stage_name":"Final","league_group":null,"goalscorers":[],"substitutes":[],"cards":[],"lineups":{"home_team":{"starting_lineups":[],"substitutes":[],"coaches":[],"missing_players":[]},"away_team":{"starting_lineups":[],"substitutes":[],"coaches":[],"missing_players":[]}},"statistics":[]}]}]
"""
    
    let teamJson = """

{"success":1,"result":[{"team_key":1,"team_name":"Turkey","team_logo":"https:apiv2.allsportsapi.comlogo1_turkey.jpg","players":[{"player_key":818595784,"player_name":"A. Bayu0131ndu0131r","player_number":"","player_country":null,"player_type":"Goalkeepers","player_age":"24","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers55379_a-bayindir.jpg"},{"player_key":455512248,"player_name":"U. u00c7aku0131r","player_number":"","player_country":null,"player_type":"Goalkeepers","player_age":"26","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers52614_u-cakir.jpg"},{"player_key":635680018,"player_name":"M. Gu00fcnok","player_number":"","player_country":null,"player_type":"Goalkeepers","player_age":"34","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"httpsapiv2.allsportsapi.comlogoplayers117899_m-gunok.jpg"},{"player_key":3670710692,"player_name":"S. Akaydin","player_number":"","player_country":null,"player_type":"Defenders","player_age":"29","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers41236_s-akaydin.jpg"},{"player_key":117028268,"player_name":"O. Bulut","player_number":"","player_country":null,"player_type":"Defenders","player_age":"28","player_match_played":"1","player_goals":"0","player_yellow_cards":"1","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers23646_o-bulut.jpg"},{"player_key":1541819594,"player_name":"Z. u00c7elik","player_number":"","player_country":null,"player_type":"Defenders","player_age":"26","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers42872_z-celik.jpg"},{"player_key":861177565,"player_name":"M. Demiral","player_number":"","player_country":null,"player_type":"Defenders","player_age":"25","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers51531_m-demiral.jpg"},{"player_key":2284056998,"player_name":"E. Elmalu0131","player_number":"","player_country":null,"player_type":"Defenders","player_age":"22","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers114852_e-elmali.jpg"},{"player_key":2642002810,"player_name":"O. Kabak","player_number":"","player_country":null,"player_type":"Defenders","player_age":"23","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers75017_o-kabak.jpg"},{"player_key":1418778691,"player_name":"C. u00d6zkacar","player_number":"","player_country":null,"player_type":"Defenders","player_age":"22","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogplayers115116_c-ozkacar.jpg"},{"player_key":3167712687,"player_name":"u00c7. Su00f6yu00fcncu00fc","player_number":"","player_country":null,"player_type":"Defenders","player_age":"26","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"httpapiv2.allsportsapi.comlogoplayers49955_c-soyuncu.jpg"},{"player_key":1568612340,"player_name":"M. Aydu0131n","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"","player_match_played":"","player_goals":"","player_yellow_cards":"","player_red_cards":"","player_image":"https:apiv2.allsportsapi.comlogoplayers108318_m-aydin.jpg"},{"player_key":322318492,"player_name":"H. u00c7alhanou011flu","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"29","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"httpsapiv2.allsportsapi.comlogoplayers8978_h-calhanolu.jpg"},{"player_key":3539886330,"player_name":"A. Gu00fcler","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"18","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers101787_a-guler.jpg"},{"player_key":714246851,"player_name":"F. Kadu0131ou011flu","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"23","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers63927_f-kadiolu.jpg"},{"player_key":1372186058,"player_name":"u0130. Kahveci","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"27","player_match_played":"0","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"httapiv2.allsportsapi.comlogoplayers24420_-kahveci.jpg"},{"player_key":4236408745,"player_name":"O. Kou0308ku00e7uu0308","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"22","player_match_played":"1","player_goals":"1","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers89039_o-kokcu.jpg"},{"player_key":1549838614,"player_name":"A. u00d6mu00fcr","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"","player_match_played":"","player_goals":"","player_yellow_cards":"","player_red_cards":"","player_image":"https:apiv2.allsportsapi.comlogoplayers62578_a-omur.jpg"},{"player_key":3759126096,"player_name":"S. u00d6zcan","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"25","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers54218_s-ozcan.jpg"},{"player_key":2382853571,"player_name":"u0130. Yu00fcksek","player_number":"","player_country":null,"player_type":"Midfielders","player_age":"24","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers127910_-yuksek.jpg"},{"player_key":3546667817,"player_name":"K. Aktu00fcrkou011flu","player_number":"","player_country":null,"player_type":"Forwards","player_age":"24","player_match_played":"1","player_goals":"1","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers75270_k-akturkolu.jpg"},{"player_key":714060321,"player_name":"U. Nayir","player_number":"","player_country":null,"player_type":"Forwards","player_age":"29","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers31849_u-nayir.jpg"},{"player_key":279168131,"player_name":"C. Tosun","player_number":"","player_country":null,"player_type":"Forwards","player_age":"31","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers110767_c-tosun.jpg"},{"player_key":1955266998,"player_name":"E. u00dcnal","player_number":"","player_country":null,"player_type":"Forwards","player_age":"25","player_match_played":"1","player_goals":"0","player_yellow_cards":"1","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers38530_e-unal.jpg"},{"player_key":428548380,"player_name":"C. u00dcnder","player_number":"","player_country":null,"player_type":"Forwards","player_age":"25","player_match_played":"1","player_goals":"0","player_yellow_cards":"0","player_red_cards":"0","player_image":"https:apiv2.allsportsapi.comlogoplayers52213_c-under.jpg"},{"player_key":2477233199,"player_name":"B. Yu0131lmaz","player_number":"","player_country":null,"player_type":"Forwards","player_age":"","player_match_played":"","player_goals":"","player_yellow_cards":"","player_red_cards":"","player_image":"https:apiv2.allsportsapi.comlogoplayers88743_b-yilmaz.jpg"}],"coaches":[{"coach_name":"S. Kuntz","coach_country":null,"coach_age":null}]}

"""
    
    func getLeaguesList(sportName: String, completionHandler: @escaping ([League]? , Error?) -> Void) {
        if shouldReturnError{
            completionHandler(nil,ResponseWithError.responseError)
            }else{
                if let data = decodeJsonForLeagues(){
                    completionHandler(data,nil)
            }
        }
    }
    
    func getLeagueEvent(url: String, completionHandler: @escaping ([Sportify.EventResponse]?,Error?) -> Void) {
        if shouldReturnError{
            completionHandler(nil,ResponseWithError.responseError)
            }else{
                if let data = decodeJsonForEvents(){
                    completionHandler(data,nil)
               
            }
        }
    }
    
   func getTeams(url: String, completionHandler: @escaping ([Sportify.TeamData]? , Error?) -> Void) {
       if shouldReturnError{
           completionHandler(nil,ResponseWithError.responseError)
           }else{
               if let data = decodeJsonForTeams(){
                   completionHandler(data,nil)
              
           }
       }
    }
    
    func getTeamById(url: String, completionHandler: @escaping (Sportify.TeamData?, Error?) -> Void) {
        if shouldReturnError{
            completionHandler(nil,ResponseWithError.responseError)
            }else{
                if let data = decodeJsonForTeams(){
                    completionHandler(data[0],nil)
               
            }
        }
    }
    
    
    func decodeJsonForLeagues()->([League])?{
        if let data = leagueJson.data(using: .utf8){
            if let response = try? JSONDecoder().decode(LeaguesModel.self, from: data){
                return response.result
            }
          
        }
        return nil
    }
    
    func decodeJsonForEvents()->([EventResponse])?{
        if let data = leagueJson.data(using: .utf8){
            if  let response = try? JSONDecoder().decode(EventDetailsModel.self, from: data){
                return response.result
            }
        }
        return nil
    }
    
    func decodeJsonForTeams()->([TeamData])?{
        if let data = leagueJson.data(using: .utf8){
            if  let response = try? JSONDecoder().decode(TeamModel.self, from: data){
                return response.result
            }
        }
        return nil
    }
 
}
