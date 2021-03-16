//
//  UserTableViewCell.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 01.03.2021.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
    
    func setup(from note: User) {
        idLabel.text = String(note.id)
        userIdLabel.text = String(note.userId)
        noteTitleLabel.text = note.title
        noteTextLabel.text = note.body
    }
    
}

