//
//  HomeViewModel.swift
//  Sportify
//
//  Created by ME on 31/05/2023.
//

import Foundation
class HomeViewModel{
    
    let sports = [ Sport(name: "Football", image: "football"), Sport(name: "Basketball", image: "basketball"),Sport(name: "Tennis", image: "tennis"),Sport(name: "Cricket", image: "cricket")]
    
    func getSportAtIndex(index:Int)->Sport{
        return sports[index]
    }
    
    
    func inistintiateLeaguesViewMode(index:Int)->LeaguesViewModel{
        let leaguesViewModel = LeaguesViewModel()
        leaguesViewModel.sportName = getSportAtIndex(index: index).name.lowercased()
        return leaguesViewModel
    }
    func getSportsCount()->Int{
        return sports.count
    }
}
