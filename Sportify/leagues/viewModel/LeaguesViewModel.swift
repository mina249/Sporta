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
    var result = [League]()
    
    
    func loadLeaguesList(for sportName:String){
        network.getLeaguesList(sportName: sportName) { [weak self](leagues , error) in
            if let leagues = leagues{
                self?.result = leagues
            }
            DispatchQueue.main.async {
                self?.bindedResult()
            }
        }
    }
    
    func getLeaugeAtIndex(index:Int)-> League{
        return result[index]
    }
}
