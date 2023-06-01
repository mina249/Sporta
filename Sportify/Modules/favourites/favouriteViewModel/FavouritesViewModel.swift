//
//  FavouritesViewModel.swift
//  Sportify
//
//  Created by ME on 25/05/2023.
//

import Foundation
class FavouritesViewModel{
    let database = DataBase()
    var favouriteTeams = [FavouriteTeam]()
    func saveToFavourites(name:String,image:Data , id:Int){
        database.saveTeamToFavourite(name: name, image: image, teamId: id)
        
    }
    
    
    func getFavourites(){
        if let  favouriteTeams =  database.getFavouriteTeams(){
            self.favouriteTeams = favouriteTeams
        }
    }
    
    func deleteTeam(id:Int){
        database.deleteTeamFromFavourites(id: id)
    }
    
    func getFavouriteTeamAtIndex(index:Int)->FavouriteTeam{
        return favouriteTeams[index]
    }
    
    func getFavouriteTeamId(index:Int) -> Int64{
        return favouriteTeams[index].teamId
    }
    func getFavouriteTeamsCount()->Int{
        return favouriteTeams.count
    }
    func deleteTeamAtIndex(index:Int){
        favouriteTeams.remove(at: index)
    }
    func inistintiateTeamViewModel(index:Int)->TeamsViewModel{
        let teamViewModel = TeamsViewModel()
        teamViewModel.teamId = Int(favouriteTeams[index].teamId)
        return teamViewModel
    }
}
