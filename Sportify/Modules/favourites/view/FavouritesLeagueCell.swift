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
        cellImage.frame.size.width = cellImage.frame.height
        cellImage.layer.cornerRadius =  cellImage.frame.size.height / 2
        cellImage.clipsToBounds = true
        
    }

    
 /*  override func layoutSubviews() {
       super.layoutSubviews()
        contentView.bounds = contentView.frame.inset(by: UIEdgeInsets(top:20, left: 20, bottom:30, right: 10))
      
    }*/
}
