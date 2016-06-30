//
//  AppStorePPTView+CollectionView.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import UIKit

extension AppStorePPTView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionViewPrepare(){
        
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
       
        collectionView.registerNib(UINib(nibName: "AppStorePPTCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: rid)
        
        self.collectionView = collectionView
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        
        addSubview(collectionView)
    }
    
    func scrollToMiddle(){
        
        let indexPath = NSIndexPath(forItem: 0, inSection: numberOfSectionsInCollectionView(collectionView)/2)
        centerIndexPathItem = indexPath.section * num
        
        if p == 1 {
            
            collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: false)
        }else {
            
            let section = numberOfSectionsInCollectionView(collectionView) * collectionView(collectionView, numberOfItemsInSection: 0) / 2
            
            jumpToPage(section, anim: false)
        }
    }
    
    func jumpToPage(page_var: Int,anim: Bool) {
        
        let w = collectionView.bounds.size.width
        let section = page_var
        let marginLeft = w * (1-p) * 0.5
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInsetLeft = layout.sectionInset.left
        let minimumLineSpacing = layout.minimumLineSpacing
        let offset = CGPointMake(w * p * CGFloat(section) + sectionInsetLeft + minimumLineSpacing * (CGFloat(section) - 1) - marginLeft, 0)
        
        if anim {
            collectionView.setContentOffset(offset, animated: true)
//            UIView.animateWithDuration(0.25, animations: { 
//                
//                self.collectionView.contentOffset = offset
//            })
        }else {
            collectionView.contentOffset = offset
        }
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return num
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if !isScrollMiddle {scrollToMiddle(); isScrollMiddle = true}
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(rid, forIndexPath: indexPath) as! AppStorePPTCollectionViewCell

        itemClosure?(imgV:cell.imgV, item:indexPath.row)
        
        return cell
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        check()
        
        let offsetX = scrollView.contentOffset.x
        let sectionLeft = layout.sectionInset.left
        let itemMargin = layout.minimumLineSpacing
        let scrolledPage_CGFlot = (offsetX - sectionLeft) / (scrollView.bounds.size.width * p + itemMargin)
        let scrolledPage_Int = Int(scrolledPage_CGFlot)
        centerIndexPathItem = scrolledPage_Int
    }
    
    func check(){
        if centerIndexPathItem % num == 0 {scrollToMiddle(); print("滚动到中间")}
    }
    
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timerOff()
//        collectionView.pagingEnabled = true
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        collectionView.pagingEnabled = false
        timerOn()
    }
}
