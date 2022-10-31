//
//  APIErrorHandring.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/19.
//

import Foundation

enum APIError: Error {
    
    case invalidUrl
    case badRequest //400
    case forbidden //403
    case notFound //404
    case internalServerError //500
    case invalidData
    case unknownError
    case error(err: String)
    case decodingError(err: String)
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "statusCode 400: 構文無効であるためサーバーがリクエストを理解できません"
        case .forbidden:
            return "statusCode 403: アクセス権がありません"
        case .notFound:
            return "statusCode 404: リソースが発見できません、URLが無効です"
        case .internalServerError:
            return "statusCode 500: サーバーが処理できませんでした"
        default:
            return nil
        }
    }
}
