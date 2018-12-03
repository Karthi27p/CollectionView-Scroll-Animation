//
//  CustomTableViewCell.swift
//  CollectionViewAnimation
//
//  Created by Karthi on 18/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell{

    
    @IBOutlet var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
