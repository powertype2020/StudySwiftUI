//
//  APIErrorHandring.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/19.
//

import Foundation

enum APIError: Error {
    
    case serchTextEmpty
    case invalidUrl
    case networkError
    case unknown
    
    var errorTitle: String {
        switch self {
        case .networkError:
            return "ネットワークエラーです"
        case .unknown:
            return "不明なエラーです"
        case .invalidUrl:
            return "無効なURLです"
        default:
            return "検索エラー"
        }
    }
    
    var description: String {
        switch self {
        case .serchTextEmpty:
            return "検索ワードを入力してください"
        case .invalidUrl:
            return "他の検索ワードを入力してください"
        case .networkError:
            return "接続環境のいいところでもう一度検索してください"
        case .unknown:
            return "不明なエラーです"
        }
    }
}
