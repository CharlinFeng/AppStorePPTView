//
//  AppStorePPTView+Timer.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import Foundation


extension AppStorePPTView {

    func timerOn(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func timerOff(){
       
        timer.invalidate()
        timer = nil
    }

    func run(){
        
        centerIndexPathItem += 1
        let newItem = centerIndexPathItem
        jumpToPage(newItem, anim: true)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(0.25 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.check()
        })
        print(centerIndexPathItem)
    }

}