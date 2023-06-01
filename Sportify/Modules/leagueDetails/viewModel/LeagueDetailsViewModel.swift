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
    var leagueId:Int?
    var sportName:String?

    func loadCommingEvents(){
        let commingUrl = "\(K.baseUrl)\(sportName ?? K.SportName.footbaall)\(EventsURL)&leagueId=\(leagueId ?? 1 )&from=\(K.getCurrentDate())&to=\(K.getNextDate())"
        network.getLeagueEvent(url: commingUrl) {[weak self] (events ,error) in
            if let events = events{
                self?.commingEvents = events
            }
            DispatchQueue.main.async {
                self?.bindedResult()
            }
        }
    }
    func loadFinishedEvents(){
        let commingUrl = "\(K.baseUrl)\(sportName ?? K.SportName.footbaall)\(EventsURL)&leagueId=\(leagueId ?? 1)&from=\(K.getPastDate())&to=\(K.getCurrentDate())"
        network.getLeagueEvent(url: commingUrl) { [weak self](events , error) in
            if let events = events{
                self?.fineshedEvents = events
            }
            DispatchQueue.main.async {
                self?.bindedFinishedResult()
            }
        }
    }
    
    func loadTeams(){
        let url = "\(K.baseUrl)\(sportName ?? K.SportName.footbaall)\(teamsUrl)&leagueId=\(leagueId ?? 1)"
        network.getTeams(url: url) { [weak self](teams , error) in
            if let teams = teams{
                self?.teams = teams
            }
            DispatchQueue.main.async {
                self?.teamsResult()
            }
        }
        
    }
    
    
    func getFinshedEvent(index:Int)->Event{
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
    
    func getCommingEvent(index:Int)->Event{
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
    
    func getCommingEventsCount()->Int{
        return commingEvents.count
    }
    func getFinishedEventsCount()->Int{
        return fineshedEvents.count
    }
    func getTeamsCount()->Int{
        return teams.count
    }
    
    func getSportName()->String?{
        return sportName
    }
    func inistintiateTeamViewModel(index:Int)->TeamsViewModel{
        let teamViewModel = TeamsViewModel()
        teamViewModel.teamId = teams[index].team_key
        return teamViewModel
    }
}
