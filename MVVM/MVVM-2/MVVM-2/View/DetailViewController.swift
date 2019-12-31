//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by wtildestar on 29/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.age.bind(listener: { [unowned self] in
            guard let string = $0 else { return } // $0 достучался до параметра T когда нет имени параметра
            self.textLabel.text = string
        })
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "Some New Value"
        }
    }
    
    // позволяет определить острочку перед выполнение какого-либо кложера
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
    
}
