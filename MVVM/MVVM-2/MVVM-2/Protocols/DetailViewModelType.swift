//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by wtildestar on 29/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
