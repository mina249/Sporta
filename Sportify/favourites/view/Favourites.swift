//
//  Favourites.swift
//  Sportify
//
//  Created by ME on 21/05/2023.
//

import UIKit
import CoreData

class Favourites: UITableViewController {
    var favourites = [FavouriteTeam]()
    let favouriteViewModel = FavouritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FavouritesLeagueCell", bundle: nil), forCellReuseIdentifier: K.leagueCellIdentifier)
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favourites.count
    }

    override func viewWillAppear(_ animated: Bool) {
        if let favouriteTeams = favouriteViewModel.getFavourites(){
            favourites = favouriteTeams
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.leagueCellIdentifier, for: indexPath) as! FavouritesLeagueCell
        let favTeam = favourites[indexPath.row]
        cell.cellImage.image = UIImage(data: favTeam.image!)
        cell.cellLabel.text = favTeam.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Delete Team", message: "Are you sure you want to delete this Team from Favourites?", preferredStyle: .actionSheet)

             alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {
                 (alert:UIAlertAction!) in
                 self.favouriteViewModel.deleteTeam(team: self.favourites[indexPath.row])
                 self.favourites.remove(at: indexPath.row)
                 self.tableView.reloadData()
                  
             }))
             alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

             self.present(alert, animated: true, completion: nil)
         }
    }
    
    

  
  



    
    

}
