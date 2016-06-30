//
//  AppStorePPTCollectionViewCell.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import UIKit

class AppStorePPTCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.borderWidth = 2
        layer.borderColor = UIColor.redColor().CGColor
    }

}
