//
//  Loader.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 15.03.2021.
//

import Foundation

class NoteLoader {
    
    private let baseURL = "https://reqres.in/api"
    private let session = URLSession.shared
    private var loadUsers: [User] = []
    
    func getUser() {
        
    }
    
    func load(with completion: @escaping ([User]) -> Void) {
        guard loadUsers.count == 0 else {
            completion(loadUsers)
            return
        }
        
        let url = URL(string: "\(baseURL)/users")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            
            print(String(data: data, encoding: String.Encoding.utf8))
            do {
                let responseData = try JSONDecoder().decode(Data.self, from: data)
                
                self?.loadUsers = responseData.data
                
                DispatchQueue.main.async {
                    completion(responseData.data)
                }
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }
    
}
