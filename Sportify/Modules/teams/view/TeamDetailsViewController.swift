//
//  TeamDetails.swift
//  Sportify
//
//  Created by ME on 22/05/2023.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {

    @IBOutlet var favBtn: UIButton!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var teanView: UIView!
    @IBOutlet var playersCollection: UICollectionView!
    @IBOutlet var coachName: UILabel!
    @IBOutlet var teanName: UILabel!
    @IBOutlet var teamImg: UIImageView!
    var teamViewModel :TeamsViewModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        teamImg.frame.size.width = teamImg.frame.size.height
        teamImg.layer.cornerRadius = teamImg.frame.size.height / 2
        teamImg.image = UIImage(named: "noImage")
        playersCollection.dataSource = self
        playersCollection.dataSource = self
        teanView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 30)
        loadTeamData()
      
    }
    func loadTeamData(){
        teamViewModel?.bindedResult={
            let currentTeam = self.teamViewModel?.getTeam()
            self.teamImg.sd_setImage(with: URL(string: currentTeam?.team_logo ?? "") , placeholderImage: UIImage(named: "noImage"))
            self.teanName.text = currentTeam?.team_name
            self.coachName.text = self.teamViewModel?.getCoachName()
            self.loading.isHidden = true
            if let teamId = self.teamViewModel?.getTeamId(){
                self.isFavourite(id: teamId )
            }
            self.playersCollection.reloadData()
        }
        teamViewModel?.loadTeamDetails()
    }

    override func viewWillAppear(_ animated: Bool) {
        teanView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 30)
       
    }
    
    func addTeamToFavourites(){
        if let imageData = teamImg.image?.jpegData(compressionQuality: 1.0) , let id = teamViewModel?.getTeamId() , let name = teanName.text{
            teamViewModel?.addTeamToFavourites(name: name, image: imageData, teamId: id)
        }
    }

    @IBAction func favBtnPressed(_ sender: UIButton) {
        
        if teamViewModel?.isFavouriteTeam(id: teamViewModel?.getTeamId() ?? 0) ?? false{
            self.showDeleteConfirmationAlert()
        }else{
            addTeamToFavourites()
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}

extension TeamDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamViewModel?.getPlayersCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: K.playersCellIdentifier, for: indexPath) as! PlayersCell
        let player = teamViewModel?.getPlayerAteIndex(index: indexPath.row)
        cell.playerImg.sd_setImage(with: URL(string: player?.player_image ?? "") , placeholderImage: UIImage(named: "noImage"))
        cell.playerName.text = player?.player_name
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
    
    func isFavourite(id:Int){
        if teamViewModel?.isFavouriteTeam(id: id) ?? false {
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func showDeleteConfirmationAlert(){
        let alert = UIAlertController(title: "Delete Team", message: "Are you sure you want to delete this Team from Favourites?", preferredStyle: .actionSheet)

         alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {
             (alert:UIAlertAction!) in
             self.teamViewModel?.deleteTeamFromFavourites()
             self.favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
            
         }))
         alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

         self.present(alert, animated: true, completion: nil)
     }
    
   
        
    
}
    
    

