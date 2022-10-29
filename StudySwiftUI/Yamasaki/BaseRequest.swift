//
//  BaseRequest.swift
//  StudySwiftUI
//
//  Created by 山﨑隼汰 on 2022/10/29.
//

import Foundation

protocol BaseRequest {
    associatedtype Response
    var url: String { get }
    var httpMethod: String { get }
    var headers: [String: String] { get }
    func decode(from data: Data) throws -> Response
}

extension BaseRequest {
    var urlRequest: URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
