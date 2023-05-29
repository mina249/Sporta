//
//  LeagueDetails.swift
//  Sportify
//
//  Created by ME on 22/05/2023.
//

import UIKit
import SDWebImage
private let reuseIdentifier = "Cell"

class LeagueDetails: UICollectionViewController {
    let detailsModel = LeagueDetailsViewModel()
    var sportName:String?
    @IBOutlet var loading: UIActivityIndicatorView!
    var sportId:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let layout = UICollectionViewCompositionalLayout{ sectionIndex , enviroment in
            switch sectionIndex{
            case 0:
                return self.bottomSection()
            case 1:
                return self.midSection()
            default:
                return self.bottomSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(UINib(nibName: "SectionHeader", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "headerCell")
        collectionView.register(UINib(nibName: "NoDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: K.noDataIdentifier)
        
        loadFootBallEvents()
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section{
        case 0:
            if detailsModel.commingEvents.count>0{
                return detailsModel.commingEvents.count
            }else{
                return 1
            }
        case 2:
            if detailsModel.fineshedEvents.count > 0{
                return detailsModel.fineshedEvents.count
            }else{
                return 1
            }
            
        default:
            if detailsModel.teams.count > 0 {
                
                return detailsModel.teams.count
            }else{
                return 1
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section{
            
        case 0 :
            if detailsModel.commingEvents.count > 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.leagueDetailsCell, for: indexPath) as! LeagueDetailsCell
                let event = detailsModel.getCommingEvent(sportName: sportName!, index: indexPath.row)
                cell.score.text = event.finalResult
                cell.firstTeamImg.sd_setImage(with: URL(string: event.firstTeamLogo ), placeholderImage: UIImage(named: "noImage"))
                cell.firstTeamName.text = event.firstTeamName
                cell.secTeamImg.sd_setImage(with: URL(string: event.secTeamLogo), placeholderImage: UIImage(named: "noImage"))
                cell.secTeamName.text = event.SecTeamName
                cell.date.text = event.date
                cell.time.text = event.time
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.noDataIdentifier, for: indexPath) as! NoDataCollectionViewCell
                return cell
            }
        case 1:
            if detailsModel.teams.count > 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.teamLogoCell, for: indexPath) as! TeamsLogoCell
                let team = detailsModel.getTeam(index: indexPath.row)
                cell.teamLogo.frame.size.width = cell.teamLogo.frame.height
                cell.teamLogo.layer.cornerRadius = 20
                cell.teamLogo.sd_setImage(with: URL(string: team.logo ), placeholderImage: UIImage(named: "noImage"))
                cell.teamName.text = team.name
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.noDataIdentifier, for: indexPath) as! NoDataCollectionViewCell
                return cell
            }
        default:
            if detailsModel.fineshedEvents.count > 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.leagueDetailsCell, for: indexPath) as! LeagueDetailsCell
                let event = detailsModel.getFinshedEvent(sportName: sportName!, index: indexPath.row)
                cell.score.text = event.finalResult
                cell.firstTeamImg.sd_setImage(with: URL(string: event.firstTeamLogo ), placeholderImage: UIImage(named: "noImage"))
                cell.firstTeamName.text = event.firstTeamName
                cell.secTeamImg.sd_setImage(with: URL(string: event.secTeamLogo ), placeholderImage: UIImage(named: "noImage"))
                cell.secTeamName.text = event.SecTeamName
                cell.date.text = event.date
                cell.time.text = event.time
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.noDataIdentifier, for: indexPath) as! NoDataCollectionViewCell
                return cell
                
            }
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.section == 1 && sportName == K.SportName.footbaall){
            let team = detailsModel.getTeam(index: indexPath.row)
            if let teamsVC = storyboard?.instantiateViewController(withIdentifier: K.teamClassIdentifier) as? TeamDetailsViewController{
                    teamsVC.teamId = team.id
                    navigationController?.pushViewController(teamsVC, animated: true)
        }
        
        }else{
            showAlert()
        }
    }
    func bottomSection()-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 20, trailing: 0)
        //header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header" , alignment: .top)
        section.boundarySupplementaryItems = [header]
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
            
            
            
        }
        return section
    }
    
    
    func midSection()->NSCollectionLayoutSection{
        let itemSize : NSCollectionLayoutSize!
        let groupSize : NSCollectionLayoutSize!
        if detailsModel.teams.count > 0 {
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(0.25))
        }else{
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .fractionalHeight(0.25))
        }
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 30 ,trailing: 0)
        
        //header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:.fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header" , alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        
        return section
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind , withReuseIdentifier: "headerCell", for: indexPath) as! SectionHeader
        switch indexPath.section{
        case 0:
          
            sectionHeader.headerTitle.text = "Up Comming Events"
            
        case 1:
            sectionHeader.headerTitle.text = "League Teams"
        default:
            sectionHeader.headerTitle.text = "Finshed Events"
        }
    
        return sectionHeader
       

    }

    func loadFootBallEvents(){
    
        detailsModel.bindedFinishedResult={
            self.loading.isHidden = true
            self.collectionView.reloadData()
        }
        detailsModel.bindedResult={
            self.collectionView.reloadData()
          
        }
        detailsModel.teamsResult={
            self.collectionView.reloadData()
        }
        guard let sportName = sportName,let sportId = sportId else{return
            
        }
        detailsModel.loadCommingEvents(for: sportName, and:sportId)
        detailsModel.loadFinishedEvents(for: sportName, and: sportId)
        detailsModel.loadTeams(sportName: sportName, leagueId: sportId)
      
        collectionView.reloadData()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "No Details", message: "This Team has no detailds to show", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default){ (action) in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
}

