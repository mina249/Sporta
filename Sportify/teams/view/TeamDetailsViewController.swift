//
//  TeamDetails.swift
//  Sportify
//
//  Created by ME on 22/05/2023.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {

    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var teanView: UIView!
    @IBOutlet var playersCollection: UICollectionView!
    @IBOutlet var coachName: UILabel!
    @IBOutlet var teanName: UILabel!
    @IBOutlet var teamImg: UIImageView!
    let teamViewModel = TeamsViewModel()
    var currentTeam : TeamData!
    var players = [Player]()
    var teamId:Int?
    let favViewModel = FavouritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        teamImg.frame.size.width = teamImg.frame.size.height
        teamImg.layer.cornerRadius = teamImg.frame.size.height / 2
        teamImg.image = UIImage(named: "noImage")
        playersCollection.dataSource = self
        playersCollection.dataSource = self
        teanView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 30)
        teamViewModel.bindedResult={
            
            self.currentTeam = self.teamViewModel.team
            self.teamImg.sd_setImage(with: URL(string: self.currentTeam.team_logo ?? "") , placeholderImage: UIImage(named: "noImage"))
            self.teanName.text = self.currentTeam.team_name
            self.coachName.text = self.currentTeam.coaches![0].coach_name
            self.players = self.currentTeam.players!
            self.loading.isHidden = true
            self.playersCollection.reloadData()
        }
        teamViewModel.loadTeamDetails(teamId: teamId!)
     
    }
    override func viewWillAppear(_ animated: Bool) {
        teanView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 30)
    }
    func addTeamToFavourites(){
        if let imageData = teamImg.image?.jpegData(compressionQuality: 1.0) , let id = currentTeam.team_key , let name = teanName.text{
            favViewModel.saveToFavourites(name: name, image: imageData, id: id)
        }
    }

    @IBAction func favBtnPressed(_ sender: UIButton) {
        addTeamToFavourites()
    }
}

extension TeamDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: K.playersCellIdentifier, for: indexPath) as! PlayersCell
       let player = players[indexPath.row]
        cell.playerImg.sd_setImage(with: URL(string: player.player_image ?? "") , placeholderImage: UIImage(named: "noImage"))
        cell.playerName.text = player.player_name
        cell.playerImg.frame.size.width = cell.playerImg.frame.size.height
        cell.playerImg.layer.cornerRadius = cell.playerImg.frame.size.width / 2
        cell.playerImg.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width*0.45 , height: self.view.frame.width*0.45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 5, bottom: 0, right: 5)
    }
    
   
    
    
    
}
