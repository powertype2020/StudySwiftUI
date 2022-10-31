//
//  GenericAPIMethod.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/23.
//

import Foundation

func fetch<T: Codable>(to dataClass: T.Type, with url: URL, completion: @escaping(Result<T, APIError>) -> Void) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print(String(describing: error!))
            completion(.failure(.error(err: error!.localizedDescription)))
            return
        }
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let httpResponse = response as? HTTPURLResponse
            switch httpResponse?.statusCode {
            case 400:
                completion(.failure(.badRequest))
            case 403:
                completion(.failure(.forbidden))
            case 404:
                completion(.failure(.notFound))
            case 500:
                completion(.failure(.internalServerError))
            default:
                completion(.failure(.unknownError))
            }
            return
        }
        guard let data = data else {
            completion(.failure(.invalidData))
            return
        }
        
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
        } catch let decodeError {
            completion(.failure(.decodingError(err: decodeError.localizedDescription)))
        }
    }.resume()
}
