//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by wtildestar on 29/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
