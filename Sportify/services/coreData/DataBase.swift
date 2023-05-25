//
//  DataBase.swift
//  Sportify
//
//  Created by ME on 25/05/2023.
//

import Foundation
import CoreData
import UIKit

class DataBase{
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveTeamToFavourite(name:String , image:Data,teamId:Int){
        let team = FavouriteTeam(context: context)
        team.image = image
        team.name = name
        team.teamId = Int64(teamId)
        saveTeams()
    }
    func saveTeams(){
        do{
           try context.save()
        }catch{
            print("error saving")
        }
    }
    
    
    func getFavouriteTeams()->[FavouriteTeam]?{
        let request: NSFetchRequest<FavouriteTeam> = FavouriteTeam.fetchRequest()
        do{
             return try context.fetch(request)
        }
        catch{
           return nil
        }
    }
    
    func deleteTeamFromFavourites(team:FavouriteTeam){
        context.delete(team)
        saveTeams()
    }
}
