//
//  FavouritesViewModel.swift
//  Sportify
//
//  Created by ME on 25/05/2023.
//

import Foundation
class FavouritesViewModel{
    let database = DataBase()
    func saveToFavourites(name:String,image:Data , id:Int){
        database.saveTeamToFavourite(name: name, image: image, teamId: id)
        
    }
    
    
    func getFavourites()->[FavouriteTeam]?{
        
        return database.getFavouriteTeams()
    }
    
    func deleteTeam(team:FavouriteTeam){
        database.deleteTeamFromFavourites(team: team)
    }
}
