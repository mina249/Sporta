//
//  Constants.swift
//  Sportify
//
//  Created by ME on 20/05/2023.
//

import Foundation
struct K{
    static let appName = "🏆SPORTA"
    static let collectionCellIdentifier = "collectionCell"
    static let leagueCellIdentifier = "reusableCell"
    static let leagueClassIdentifier = "league"
    static let teamClassIdentifier = "teamDetails"
    static let playersCellIdentifier = "playerCell"
    static let leagueDetailsCell = "leagueDetailsCell"
    static let leagueDetailsClassIdentifier = "leagueDetails"
    static let teamLogoCell = "teamLogoCell"
    static let APIKey = "2946a756ac2c8d4b77e4076020d1314283bbc02c397b76d770ef995f0d6f6e6e"//"2946a756ac2c8d4b77e4076020d1314283bbc02c397b76d770ef995f0d6f6e6e"
    static let baseUrl = "https://apiv2.allsportsapi.com/"
  
    struct SportName{
        static let footbaall = "football"
        static  let basketball = "basketball"
        static let tennis = "tennis"
        static let cricket = "cricket"
    }
   static func getCurrentDate() -> String{
         let date = Date()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd"
            let currentDate = dateFormatter.string(from: date)
            print(currentDate)
         return currentDate
        }
        
        static func getNextDate() -> String{
            let curentDate = Date()
            var dateComponents = DateComponents()
            dateComponents.day = 30
            
            let futureDate = Calendar.current.date(byAdding: dateComponents, to: curentDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let gomingDate = dateFormatter.string(from: futureDate!)
            print(gomingDate)
           return gomingDate
        }
        
        
        static func getPastDate() -> String {
            let calendar = Calendar.current
            let today = Date()
            let pastDate = calendar.date(byAdding: .day, value: -30, to: today)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let lastDate = dateFormatter.string(from: pastDate!)
            print(lastDate)
            return lastDate
        }

}
