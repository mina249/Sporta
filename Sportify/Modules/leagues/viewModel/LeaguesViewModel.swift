//
//  LeaguesViewModel.swift
//  Sportify
//
//  Created by ME on 23/05/2023.
//

import Foundation
class LeaguesViewModel{
    var bindedResult: (()->())={}
    var network = Network()
    var leauges = [League]()
    var sportName:String?
    
    
    func loadLeaguesList(){
        guard let sportName = sportName else{
            return
        }
        network.getLeaguesList(sportName: sportName) { [weak self](leagues , error) in
            if let leagues = leagues{
                self?.leauges = leagues
            }
            DispatchQueue.main.async {
                self?.bindedResult()
            }
        }
    }
    
    func getLeaugeAtIndex(index:Int)-> League{
        return leauges[index]
    }
    
    func  getLeaguesCount()->Int{
        return leauges.count
    }
    
    func getFilteredLeagues(_ filterString:String){
        let filteredList = leauges.filter { $0.league_name.contains(filterString)}
        filteredList.forEach{_ in
           leauges =  filteredList
        }
        
        }
    
    
    func inistintiateLeagueDetailsViewModel(index:Int)-> LeagueDetailsViewModel{
        let leagueDetailsViewModeL = LeagueDetailsViewModel()
        leagueDetailsViewModeL.sportName = sportName
        leagueDetailsViewModeL.leagueId = leauges[index].league_key
        return leagueDetailsViewModeL
    }
    }

