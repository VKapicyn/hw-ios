//
//  UserViewController.swift
//  Lesson_5
//
//  Created by Ольга Кадочникова on 16.03.2021.
//

import UIKit
import SDWebImage

class UserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var userId = 0 {
        didSet {
            loadNewUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loadNewUser() {
        let loader = NoteLoader()
        loader.getUser(userId: userId) { [ weak self ] user in
            DispatchQueue.main.async {
                self?.nameLabel.text = "\(user.firstName) \(user.lastName)"
                self?.emailLabel.text = user.email
                guard let url = URL(string: user.avatar) else { return }
                self?.imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
}
