//
//  Favourites.swift
//  Sportify
//
//  Created by ME on 21/05/2023.
//

import UIKit
import CoreData
import Reachability


class Favourites: UITableViewController {
    let reachability = try! Reachability()
    @IBOutlet var nofav: UILabel!
    let favouriteViewModel = FavouritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FavouritesLeagueCell", bundle: nil), forCellReuseIdentifier: K.leagueCellIdentifier)
        tabBarController?.tabBar.isHidden = false
       
    }
     

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favouriteViewModel.getFavouriteTeamsCount()
    }

    override func viewWillAppear(_ animated: Bool) {
        favouriteViewModel.getFavourites()
        if favouriteViewModel.getFavouriteTeamsCount() > 0{
            nofav.isHidden = true
            
        }else{
            nofav.isHidden = false
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.leagueCellIdentifier, for: indexPath) as! FavouritesLeagueCell
        let favTeam = favouriteViewModel.getFavouriteTeamAtIndex(index: indexPath.row)
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
                 self.favouriteViewModel.deleteTeam(id: Int(self.favouriteViewModel.getFavouriteTeamId(index: indexPath.row)))
                 self.favouriteViewModel.deleteTeamAtIndex(index: indexPath.row)
                 if self.favouriteViewModel.getFavouriteTeamsCount() < 1 {
                     self.nofav.isHidden = false
                 }
                 self.tableView.reloadData()
                  
             }))
             alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

             self.present(alert, animated: true, completion: nil)
          
         }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if reachability.connection == .unavailable{
            showAlert()
        }else{
            let teamVC = storyboard?.instantiateViewController(identifier: K.teamClassIdentifier) as? TeamDetailsViewController
            teamVC?.teamViewModel = favouriteViewModel.inistintiateTeamViewModel(index: indexPath.row)
            if let teamVC  = teamVC {
                navigationController?.pushViewController(teamVC, animated: true)
            }
        }
    }
    func showAlert(){
        let alert = UIAlertController(title: "No Internet", message: "Connect To internet then try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default){ (action) in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
}
