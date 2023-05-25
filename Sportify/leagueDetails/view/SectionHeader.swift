//
//  SectionHeader.swift
//  Sportify
//
//  Created by ME on 23/05/2023.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet var headerview: UIView!
    @IBOutlet var headerTitle:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerview.layer.cornerRadius = 20
    }
    
}
