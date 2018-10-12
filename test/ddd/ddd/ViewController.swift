//
//  ViewController.swift
//  ddd
//
//  Created by fisher hk on 2018/10/12.
//  Copyright © 2018年 ysh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIApplication.shared.isStatusBarHidden = true
        
        print(UIApplication.shared.windows.first?.safeAreaInsets)
    }
}

