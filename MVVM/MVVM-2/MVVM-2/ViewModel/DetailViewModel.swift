//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by wtildestar on 29/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var description: String {
        return String(describing: "\(profile.name) \(profile.secondName) is \(profile.age) old!")
    }
    
    var age: Box<String?> = Box(nil)
    
    init(profile: Profile) {
        self.profile = profile
    }
}
