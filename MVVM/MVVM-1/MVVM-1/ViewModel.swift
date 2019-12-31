//
//  ViewModel.swift
//  MVVM-1
//
//  Created by wtildestar on 28/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class ViewModel {
    
    private var profile = Profile(name: "John", secondName: "Smith", age: 33)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
}
