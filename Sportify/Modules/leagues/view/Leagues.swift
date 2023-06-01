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
    var leaguesViewModel:LeaguesViewModel?
    var startSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FavouritesLeagueCell", bundle: nil), forCellReuseIdentifier: K.leagueCellIdentifier)
        searchBar.delegate = self
        loadData()
}
            
        
    func loadData(){
        leaguesViewModel?.bindedResult = {
            self.tableView.reloadData()
        }
        leaguesViewModel?.loadLeaguesList()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return leaguesViewModel?.getLeaguesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.leagueCellIdentifier, for: indexPath) as! FavouritesLeagueCell
        let league = leaguesViewModel?.getLeaugeAtIndex(index: indexPath.row)
        cell.cellImage.sd_setImage(with: URL(string:league?.league_logo ?? ""), placeholderImage: UIImage(named: "noImage"))
        cell.cellLabel.text = league?.league_name
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailsVC = storyboard?.instantiateViewController(withIdentifier: K.leagueDetailsClassIdentifier) as! LeagueDetails
        leagueDetailsVC.leagueDetailsViewModel = leaguesViewModel?.inistintiateLeagueDetailsViewModel(index: indexPath.row)
        navigationController?.pushViewController(leagueDetailsVC, animated: true)
    
    }

}
//MARK: –> UISearchBarDelegate

extension Leagues : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            leaguesViewModel?.loadLeaguesList()
            tableView.reloadData()
        }else{
            leaguesViewModel?.getFilteredLeagues(searchBar.text ?? "")
          tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.35) {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    }
}
