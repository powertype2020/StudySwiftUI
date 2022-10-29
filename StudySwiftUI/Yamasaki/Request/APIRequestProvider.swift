//
//  APIRequestProvider.swift
//  StudySwiftUI
//
//  Created by 山﨑隼汰 on 2022/10/29.
//

import Foundation

struct APIRequestProvider {
    static func request<T: BaseRequest>(_ baseRequest: T, completion: @escaping(Result<T.Response?, YamasakiAPIError>) -> Void) {
        guard let request = baseRequest.urlRequest else { return }

        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(.error(err: error.localizedDescription)))
                return
            }

            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let httpResponse = response as? HTTPURLResponse
                switch  httpResponse?.statusCode {
                case 400:
                    completion(.failure(YamasakiAPIError.badRequest))
                case 403:
                    completion(.failure(YamasakiAPIError.forbidden))
                case 404:
                    completion(.failure(YamasakiAPIError.notFound))
                case 500:
                    completion(.failure(YamasakiAPIError.internalServerError))
                default:
                    completion(.failure(YamasakiAPIError.unknownError))
                }
                return
            }

            do {
                let json = try baseRequest.decode(from: data)
                completion(.success(json))
            } catch let decodeError {
                completion(.failure(.decodingError(err: decodeError.localizedDescription)))
            }

        })
        task.resume()
    }
}
