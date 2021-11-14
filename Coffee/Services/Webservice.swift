//
//  Webservice.swift
//  Coffee
//
//  Created by Michael Flowers on 11/13/21.
//

import Foundation
enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}
struct Resource<T: Codable> {
    let url: URL
}

class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data , response , error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                //passing data to ui so it has to be done on the main thread
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                print("the response: \(response)")
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
}
