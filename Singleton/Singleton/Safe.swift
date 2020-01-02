//
//  Safe.swift
//  Singleton
//
//  Created by wtildestar on 02/01/2020.
//  Copyright © 2020 wtildestar. All rights reserved.
//

class Safe {
    var money = 0
    static let shared = Safe()
    
    private init() {}
}
