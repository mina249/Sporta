//
//  LeagueDetailsCell.swift
//  Sportify
//
//  Created by ME on 22/05/2023.
//

import UIKit

class LeagueDetailsCell: UICollectionViewCell {

    @IBOutlet var noMatches: UILabel!
    @IBOutlet var secTeamName: UILabel!
    @IBOutlet var secTeamImg: UIImageView!
    @IBOutlet var time: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var firstTeamName: UILabel!
    @IBOutlet var firstTeamImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
         firstTeamImg.frame.size.width = firstTeamImg.frame.size.height 
        firstTeamImg.layer.cornerRadius = firstTeamImg.frame.width / 2
        secTeamImg.frame.size.width = secTeamImg.frame.size.height
        secTeamImg.layer.cornerRadius = secTeamImg.frame.width / 2
        noMatches.isHidden = true
        
    }

}
