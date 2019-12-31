//
//  ViewModel.swift
//  MVVM-3
//
//  Created by wtildestar on 31/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    @IBOutlet weak var networkManager: NetworkManager!
    
    private var movies: [String]?
    
    // беру фильмы с менеджера
    func fetchMovies(completion: @escaping() -> Void) {
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
    }
}
