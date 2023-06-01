//
//  TeamsViewModel.swift
//  Sportify
//
//  Created by ME on 24/05/2023.
//

import Foundation
class TeamsViewModel{
    var team :TeamData!
    let teamUrl = "/?met=Teams&APIkey=\(K.APIKey)"
    let network = Network()
    var teamId:Int?
    var bindedResult: (()->())={}
    let dataBase = DataBase()
    //https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&teamId=1
    
    func loadTeamDetails(){
        guard let teamId = teamId else{
            return
        }
        let teamURL = "\(K.baseUrl)\(K.SportName.footbaall)\(teamUrl)&teamId=\(teamId)"
        network.getTeamById(url: teamURL) { team,error  in
            self.team = team
            DispatchQueue.main.async {
                self.bindedResult()
            }
        }
    }
    
    func getTeam()->TeamData{
        return team
    }
    
    func getTeamId()->Int{
        
        return team?.team_key ?? 0
    }
    
    func getPlayerAteIndex(index:Int)->Player?{
        return team.players?[index]
    }
    func getPlayersCount()->Int{
        guard let players = team?.players else{
            return 0
        }
        return players.count
    }
    
    func getCoachName()->String{
        return team.coaches?[0].coach_name ?? ""
    }
    
    func addTeamToFavourites(name:String , image:Data,teamId:Int){
        dataBase.saveTeamToFavourite(name: name, image: image, teamId: teamId)
    }
    
    func isFavouriteTeam(id:Int)->Bool{
   
        return dataBase.isTeamInFavourite(id: id)
    }
    
    func deleteTeamFromFavourites(){
        if let teamId = teamId{
            dataBase.deleteTeamFromFavourites(id: teamId)
        }
    }
}

