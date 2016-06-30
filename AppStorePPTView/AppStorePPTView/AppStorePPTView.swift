//
//  AppStorePPTView.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import UIKit

class AppStorePPTView: UIView {
    
    weak var collectionView: UICollectionView!
    
    let rid = "AppStorePPTCollectionViewCell"
    
    var isScrollMiddle: Bool = false
    var p: CGFloat = 1 {didSet{self.layout.p = p;self.isScrollMiddle = false}}
    
    var num: Int = 0 {didSet{numKVO()}}
    
    var itemClosure:((imgV: UIImageView, item: Int)->Void)?
    
    let layout = AppStorePPTViewLayout()
    
    var centerIndexPathItem: Int = 0
    
    var timer: NSTimer!
    
    override init(frame: CGRect) {super.init(frame: frame); viewprepare()}
    
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); viewprepare()}
    
    func viewprepare(){
        collectionViewPrepare()
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    func numKVO(){
        if num <= 0 {return}
        collectionView.reloadData()
        timerOn()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        collectionView.frame = bounds
    }
    
    deinit {timerOff()}
}
