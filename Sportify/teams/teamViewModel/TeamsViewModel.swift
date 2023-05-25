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
    var bindedResult: (()->())={}
    //https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&teamId=1
    
    func loadTeamDetails(teamId:Int){
        let teamURL = "\(K.baseUrl)\(K.SportName.footbaall)\(teamUrl)&teamId=\(teamId)"
        network.getTeamById(url: teamURL) { team in
            self.team = team
            DispatchQueue.main.async {
                self.bindedResult()
            }
        }
    }
}

