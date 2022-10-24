//
//  GenericAPIMethod.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/23.
//

import Foundation

class GenericAPIMethod {
    
    func fetch<T: Codable>(to dataClass: T.Type, for url: URL, completion: @escaping(Result<T, APIErrorHandring>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}
