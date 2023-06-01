//
//  FavouritesLeagueCell.swift
//  Sportify
//
//  Created by ME on 20/05/2023.
//

import UIKit

class FavouritesLeagueCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var cellBuble: UIView!
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       // cellBuble.roundCorners(corners: [.topRight,.bottomLeft], radius: 30)
        cellView.layer.cornerRadius = cellBuble.frame.size.height / 5
        cellView.clipsToBounds = true
        cellView.layer.borderWidth = 2
        cellView.layer.borderColor = UIColor.orange.cgColor
        cellImage.frame.size.height = cellImage.frame.width
        cellImage.layer.cornerRadius =  cellImage.frame.size.height / 3
        cellImage.clipsToBounds = true
        
    }

    
 /*  override func layoutSubviews() {
       super.layoutSubviews()
        contentView.bounds = contentView.frame.inset(by: UIEdgeInsets(top:20, left: 20, bottom:30, right: 10))
      
    }*/
}
