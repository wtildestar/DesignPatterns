//
//  CommentCell.swift
//  MVC
//
//  Created by wtildestar on 26/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
 
    func configure(with comment: Comment) {
        self.label.text = comment.name
        self.textView.text = comment.body
    }
    
}
