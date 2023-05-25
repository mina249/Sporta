//
//  Network.swift
//  Sportify
//
//  Created by ME on 23/05/2023.
//

import Foundation
class Network{
    let leaguesURL = "/?met=Leagues&APIkey=\(K.APIKey)"
    func getLeaguesList(sportName:String, completionHandler:@escaping([League] )-> Void){
        
        if let  url = URL(string:"\(K.baseUrl)\(sportName)\(leaguesURL)"){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decodedData:LeaguesModel =  try decoder.decode(LeaguesModel.self, from: safeData)
                        let leagues = decodedData.result
                        completionHandler(leagues)
                    }catch{
                        
                    }
                }
            }
            task.resume()
        }
        
    }
        
    func getLeagueEvent(url:String,completionHandler:@escaping([EventResponse])-> Void){
   
        if let  url = URL(string:url){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
              
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decodedData:EventDetailsModel =  try decoder.decode(EventDetailsModel.self, from: safeData)
                        if let events = decodedData.result{
                            completionHandler(events)
                        }
                    }catch{
                       print("Error")
                    }
                }
                        
                        
                    }
            task.resume()
                    
                }
                
            }
        
    
    
    func getTeams(url:String,completionHandler:@escaping([TeamData])-> Void){
   
        if let  url = URL(string:url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decodedData:TeamModel =  try decoder.decode(TeamModel.self, from: safeData)
                        if let teams = decodedData.result{
                            completionHandler(teams)
                        }
                    }catch{
                       print("Error")
                    }
                }
                        
            }
            task.resume()
                    
        }
                
            }
        
    
    func getTeamById(url:String,completionHandler:@escaping(TeamData)-> Void){
   
        if let  url = URL(string:url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decodedData:TeamModel =  try decoder.decode(TeamModel.self, from: safeData)
                        if let teams = decodedData.result?[0]{
                            completionHandler(teams)
                        }
                    }catch{
                       print("Error")
                    }
                }
                        
            }
            task.resume()
                    
        }
                
            }
        
   

}
