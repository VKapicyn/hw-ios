//
//  UserViewController.swift
//  Lesson_5
//
//  Created by Ольга Кадочникова on 16.03.2021.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader = NoteLoader()
        loader.getUser(userId: userId) { user in
            self.nameLabel.text = "\(user.firstName) \(user.lastName)"
            self.emailLabel.text = user.email
            
            self.downloadImage(from: URL(string: user.avatar)!)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Foundation.Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.avatarImageView.image = UIImage(data: data)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
