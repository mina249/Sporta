//
//  Leagues.swift
//  Sportify
//
//  Created by ME on 21/05/2023.
//

import UIKit
import SDWebImage
class Leagues: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    var sportName:String? = nil
 var leagues = [League]()
    let leaguesViewModel = LeaguesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FavouritesLeagueCell", bundle: nil), forCellReuseIdentifier: K.leagueCellIdentifier)
       loadData()
        
        searchBar.delegate = self
}
            
        
    
    
    func loadData(){
        leaguesViewModel.bindedResult={
            self.leagues = self.leaguesViewModel.result
         
            self.tableView.reloadData()
       
        }
        guard let sportName = sportName else{return
            
        }
        leaguesViewModel.loadLeaguesList(for: sportName)
        
      
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesViewModel.result.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.leagueCellIdentifier, for: indexPath) as! FavouritesLeagueCell
        let league = leagues[indexPath.row]
        cell.cellImage.sd_setImage(with: URL(string:league.league_logo ?? ""), placeholderImage: UIImage(named: "noImage"))
        cell.cellLabel.text = league.league_name
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailsVC = storyboard?.instantiateViewController(withIdentifier: K.leagueDetailsClassIdentifier) as! LeagueDetails
        leagueDetailsVC.sportName = sportName!
        leagueDetailsVC.sportId = leaguesViewModel.getLeaugeAtIndex(index: indexPath.row).league_key
        navigationController?.pushViewController(leagueDetailsVC, animated: true)
    
    }

}
//MARK: –> UISearchBarDelegate

extension Leagues : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadData()
        }else{
            let filtered = leagues.filter{ $0.league_name.contains(searchBar.text!) }
            filtered.forEach { print($0)
               leagues = filtered
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.35) {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    }
}
