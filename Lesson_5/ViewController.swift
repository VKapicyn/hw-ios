//
//  ViewController.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var loader = NoteLoader()
    var data: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var userId = 0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.load { [weak self] notes in
            self?.data = notes
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newUser" {
            let user = segue.destination as! UserViewController
            user.userId = userId
        }
    }

}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        cell.setup(from: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        userId = data[indexPath.row].id
        performSegue(withIdentifier: "newUser", sender: nil)
    }
    
}

