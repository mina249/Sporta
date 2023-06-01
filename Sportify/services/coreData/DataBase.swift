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
      let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init(){
       context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func saveTeamToFavourite(name:String , image:Data,teamId:Int){
        let team = FavouriteTeam(context:context)
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
    
    func fetchFavouriteTeamById(id:Int)->[FavouriteTeam]?{
        let request: NSFetchRequest<FavouriteTeam> = FavouriteTeam.fetchRequest()
        request.predicate  = NSPredicate(format: "teamId MATCHES %@ ", "\(Int64(id))")
        do{
          return try context.fetch(request)
            
        }catch{
           return nil
        }
    }
    
    func deleteTeamFromFavourites(id:Int){
        let team = fetchFavouriteTeamById(id: id)
        if let deletedTeam = team?[0]{
            context.delete(deletedTeam)
            saveTeams()
        }
    }
    
    func isTeamInFavourite(id:Int)->Bool{
        let  team = fetchFavouriteTeamById(id: id)
            return team?.count ?? 0 > 0
    }
}
