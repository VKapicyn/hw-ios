//
//  Loader.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 15.03.2021.
//

import Foundation

class NoteLoader {
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let session = URLSession.shared
    private var loadedNotes: [Note] = []
    
    func load(with completion: @escaping ([Note]) -> Void) {
        guard loadedNotes.count == 0 else {
            completion(loadedNotes)
            return
        }
        
        let url = URL(string: "\(baseURL)/posts")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let notes = try JSONDecoder().decode([Note].self, from: data)
                
                self?.loadedNotes = notes
                
                DispatchQueue.main.async {
                    completion(notes)
                }
            } catch {
                print("ERROR!")
            }
        }
        
        task.resume()
    }
    
}
