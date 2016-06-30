//
//  AppStorePPTViewLayout.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import UIKit

class AppStorePPTViewLayout: UICollectionViewFlowLayout {
    
    let margin: CGFloat = 5
    var p: CGFloat = 1
    
    override init() {
        super.init()
        
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        minimumLineSpacing = margin
        minimumInteritemSpacing = margin
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareLayout() {
        
        super.prepareLayout()
        
        let size = collectionView?.bounds.size ?? CGSizeZero
        
        print("collectionView?.bounds.size:\(collectionView?.bounds.size)")
        
        itemSize = CGSizeMake(size.width * p, size.height)
        
        sectionInset = UIEdgeInsetsMake(0, margin, 0, 0)
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let rect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, collectionView?.bounds.width ?? 0, collectionView?.bounds.height ?? 0)
        
        let attrs = layoutAttributesForElementsInRect(rect)
        
        var deltaX: CGFloat = CGFloat.max
        
        let collectionCenterX = proposedContentOffset.x + (collectionView?.bounds.size.width ?? 0) * 0.5
        
        for (_,attr) in attrs!.enumerate() {
            
            let newDelta = attr.center.x - collectionCenterX
            
            if abs(deltaX) > abs(newDelta) {deltaX = newDelta}
        }
        
        let newOffset = CGPointMake(proposedContentOffset.x + deltaX, proposedContentOffset.y)
        
        return newOffset
    }
    
    
}
