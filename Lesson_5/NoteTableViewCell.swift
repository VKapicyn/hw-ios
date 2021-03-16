//
//  UserTableViewCell.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 01.03.2021.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var emailTextLabel: UILabel!
    
    func setup(from note: Note) {
        nameTextLabel.text = note.title
        emailTextLabel.text = note.body
    }
    
}

