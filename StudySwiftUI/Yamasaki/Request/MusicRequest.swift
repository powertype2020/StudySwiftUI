//
//  MusicRequest.swift
//  StudySwiftUI
//
//  Created by 山﨑隼汰 on 2022/10/29.
//

import Foundation

struct MusicRequest: BaseRequest {
    typealias Response = MusicResponse

    var serchText: String
    var limit: Int
    var offset: Int

    var url: String {
        return "https://itunes.apple.com/search?term=\(serchText)&limit=\(limit)&offset=\(offset)"
    }

    var httpMethod: String {
        return "GET"
    }

    var headers: [String : String] {
        return [:]
    }

    func decode(from data: Data) throws -> MusicResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(MusicResponse.self, from: data)
    }
}
