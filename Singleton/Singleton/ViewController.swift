//
//  ViewController.swift
//  Singleton
//
//  Created by wtildestar on 02/01/2020.
//  Copyright © 2020 wtildestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safe = Safe.shared
        print(safe.money)
        
    }
    
}

