//
//  GenericAPIMethod.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/23.
//

import Foundation

class NetworkManeger {
    
    var API = iTunesAPI()
    var serchText = "Eminem"
    let limit = 20
    var page = 0
    
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
    
    func fetchTodo() {
        let request = iTunesAPI()
        guard let requestURL = request.createURL(for: serchText, limit: limit, offset: limit * page) else { return }
        let result: () = fetch(to: Response.self, for: requestURL, completion: { result in
            switch(result) {
            case let .success(json):
                dump(json)
            case let .failure(error):
                switch error {
                case .invalidResponse:
                    print("サーバーエラーです")
                case .invalidData:
                    print("データが無効です")
                case .error:
                    print("エラーです")
                case .decodingError(err: _):
                    print("デコードエラーです")
                case .invalidUrl:
                    print("URLが無効です")
                }
            }
        })
        print(result)
        print(requestURL)
        self.page += 1
    }
}
