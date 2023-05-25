//
//  LeagueDetailsViewModel.swift
//  Sportify
//
//  Created by ME on 24/05/2023.
//

import Foundation

class LeagueDetailsViewModel{
    var bindedResult: (()->())={}
    var bindedFinishedResult: (()->())={}
    var teamsResult: (()->())={}
    var network = Network()
    var commingEvents = [EventResponse]()
    var fineshedEvents=[EventResponse]()
    var teams = [TeamData]()
    let EventsURL = "/?met=Fixtures&APIkey=\(K.APIKey)"
    var teamsUrl = "/?met=Teams&APIkey=\(K.APIKey)"
    
    
    
    
    
    
  
    
    
    func loadCommingEvents(for sportName:String, and id:Int){
        let commingUrl = "\(K.baseUrl)\(sportName)\(EventsURL)&leagueId=\(id)&from=\(K.getCurrentDate())&to=\(K.getNextDate())"
        network.getLeagueEvent(url: commingUrl) {[weak self] (events) in
            self?.commingEvents = events
            DispatchQueue.main.async {
                self?.bindedResult()
            }
        }
    }
    func loadFinishedEvents(for sportName:String, and id:Int){
        let commingUrl = "\(K.baseUrl)\(sportName)\(EventsURL)&leagueId=\(id)&from=\(K.getPastDate())&to=\(K.getCurrentDate())"
        network.getLeagueEvent(url: commingUrl) { [weak self](events) in
            self?.fineshedEvents = events
            print("finished: \(events.count)")
            DispatchQueue.main.async {
                self?.bindedFinishedResult()
            }
        }
    }
    
    func loadTeams(sportName:String,leagueId:Int){
        let url = "\(K.baseUrl)\(sportName)\(teamsUrl)&leagueId=\(leagueId)"
        network.getTeams(url: url) { [weak self](teams) in
            self?.teams = teams
            DispatchQueue.main.async {
                self?.teamsResult()
            }
        }
        
    }
    
    
    func getFinshedEvent(sportName:String , index:Int)->Event{
        let event =  fineshedEvents[index]
        switch sportName{
            
        case K.SportName.footbaall:
            return Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.home_team_logo ?? "", secTeamLogo: event.away_team_logo ?? "", finalResult: event.event_final_result ?? "")
        case K.SportName.cricket:
            return  Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date_start!, time: event.event_time!, firstTeamLogo: event.event_home_team_logo ?? "", secTeamLogo: event.event_away_team_logo ?? "", finalResult: event.event_away_final_result ?? "")
        case K.SportName.tennis:
            return Event(firstTeamName: event.event_first_player!, SecTeamName:event.event_second_player!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.event_first_player_logo ?? "", secTeamLogo: event.event_second_player_logo ?? "",finalResult: event.event_final_result ?? "")
        default:
            return Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.event_home_team_logo ?? "", secTeamLogo: event.event_away_team_logo ?? "", finalResult: event.event_final_result ?? "")
        }
    }
    
    func getCommingEvent(sportName:String , index:Int)->Event{
        let event =  commingEvents[index]
        switch sportName{
            
        case K.SportName.footbaall:
            return Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.home_team_logo ?? "", secTeamLogo: event.away_team_logo ?? "")
        case K.SportName.cricket:
            return Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date_stop!, time: event.event_time!, firstTeamLogo: event.event_home_team_logo ?? "", secTeamLogo: event.event_away_team_logo ?? "")
        case K.SportName.tennis:
            return Event(firstTeamName: event.event_first_player!, SecTeamName:event.event_second_player!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.event_first_player_logo ?? "", secTeamLogo: event.event_second_player_logo ?? "")
            
        default:
            return Event(firstTeamName: event.event_home_team!, SecTeamName: event.event_away_team!, date: event.event_date!, time: event.event_time!, firstTeamLogo: event.event_home_team_logo ?? "", secTeamLogo: event.event_away_team_logo ?? "")
        }
    }
    
    func getTeam(index:Int)->Team{
        let team = teams[index]
        return Team(name: team.team_name!, logo: team.team_logo ?? "", id: team.team_key!)
        
    }
}
