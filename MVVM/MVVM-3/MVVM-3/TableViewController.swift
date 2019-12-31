//
//  ViewController.swift
//  MVVM-3
//
//  Created by wtildestar on 31/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // когда получаю новый фильм обновляю интерфейс в основном потоке с вьюмодели
        viewModel.fetchMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // работаю с вьюмоделью TableViewController'a через метод
        cell.textLabel?.text = viewModel.titleForCell(atIndexPath: indexPath)
        return cell
    }
}

