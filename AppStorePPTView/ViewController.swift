//
//  ViewController.swift
//  AppStorePPTView
//
//  Created by 冯成林 on 16/6/30.
//  Copyright © 2016年 冯成林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aspv: AppStorePPTView!
    
    var imgs: [String] = ["1","2","3","4","5"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aspv.p = 0.8
        
        aspv.num = imgs.count
        aspv.itemClosure = { v, i in
            v.image = UIImage(named: self.imgs[i])
        }
        
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    


}

