//
//  NetworkHandler.swift
//  AuthorShelf
//
//  Created by Sudharshan on 26/06/24.
//

import Foundation

class NetworkHandler {
    
    static var shared = NetworkHandler()
    
    private init() {
        
    }
    
    func fetchData(completion: @escaping (Result<[Photo], Error>) -> Void) {
        let urlString = "https://picsum.photos/v2/list?page=2&limit=20"
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if let error1 = error {
                    print("Error occured while fetching data\(error1)")
                    return
                }
                
                guard let gotData = data else {return}
                
                do {
                    
                    let decoder = JSONDecoder()
                    let data = try decoder.decode([Photo].self, from: gotData)
                    print(data)
                    completion(Result.success(data))
                    
                }catch {
                    completion(.failure(error))
                }
                
                
            }
            
            task.resume()
        }
        
    }
}


