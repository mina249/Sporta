//
//  TeamsLogoCell.swift
//  Sportify
//
//  Created by ME on 23/05/2023.
//

import UIKit

class TeamsLogoCell: UICollectionViewCell {
    
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // teamLogo.frame.size.height = teamLogo.frame.size.width
        teamLogo.layer.cornerRadius = 70
        teamLogo.clipsToBounds = true
    }
}
