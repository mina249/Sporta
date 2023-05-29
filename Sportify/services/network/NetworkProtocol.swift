//
//  NetworkProtocol.swift
//  Sportify
//
//  Created by ME on 27/05/2023.
//

import Foundation
protocol NetworkProtocol{
    
    func getLeaguesList(sportName:String, completionHandler:@escaping([League]? , Error?)-> Void)
    func getLeagueEvent(url:String,completionHandler:@escaping([EventResponse]? ,Error?)-> Void)
    func getTeams(url:String,completionHandler:@escaping([TeamData]? , Error?)-> Void)
    func getTeamById(url:String,completionHandler:@escaping(TeamData?,Error?)-> Void)
}
