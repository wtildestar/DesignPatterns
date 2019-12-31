//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by wtildestar on 31/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> Void) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
    
}
