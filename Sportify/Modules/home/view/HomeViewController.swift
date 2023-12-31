//
//  HomeViewController.swift
//  Sportify
//
//  Created by ME on 20/05/2023.
//

import UIKit
import Reachability


class HomeViewController: UIViewController {
    let reachability = try! Reachability()
    @IBOutlet var sportsCollectionView: UICollectionView!
    @IBOutlet var appNameLabel: UILabel!
    @IBOutlet var sportsCtegoryView: UIView!
        let homeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(red: 36/255, green: 36/255, blue: 36/255, alpha: 1)
        self.tabBarController?.tabBar.backgroundColor = color
        sportsCollectionView.dataSource = self
        sportsCollectionView.delegate = self
        sportsCtegoryView.roundCorners(corners: [.topLeft,.topRight], radius: 30)
    }
    override func viewWillAppear(_ animated: Bool) {
        appNameLabel.text = ""
        sportsCtegoryView.roundCorners(corners: [.topLeft,.topRight], radius: 30)
        //tabBarController?.tabBar.isHidden = false

    }
    override func viewDidAppear(_ animated: Bool) {
       
        let title = K.appName
       var cahrIndex = 0.0
        
        for letter in title{
            
            Timer.scheduledTimer(withTimeInterval: 0.2*cahrIndex, repeats: false) { timer in
                self.appNameLabel.text?.append(letter)
            }
            cahrIndex+=1
            
        }
        sportsCtegoryView.roundCorners(corners: [.topLeft,.topRight], radius: 30)
    }
    
        
    }

   



extension UIView{
    func roundCorners(corners:UIRectCorner , radius:CGFloat){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCellIdentifier, for: indexPath) as! SportsCollectionViewCell
        let sport = homeViewModel.getSportAtIndex(index: indexPath.row)
        cell.sportName.text = sport.name
        cell.sportsImage.image = UIImage(named: sport.image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.45, height: self.view.frame.width*0.45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.height*0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if reachability.connection == .unavailable{
            showAlert()
        }else{
            let leagueVC =  storyboard?.instantiateViewController(identifier: K.leagueClassIdentifier) as! Leagues
            leagueVC.leaguesViewModel = homeViewModel.inistintiateLeaguesViewMode(index: indexPath.row)
            navigationController?.pushViewController(leagueVC, animated: true)
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
