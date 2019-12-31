//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by wtildestar on 29/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelType: class {
    var fullName: String { get }
    var age: String { get }
}
