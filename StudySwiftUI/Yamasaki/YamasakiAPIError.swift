//
//  YamasakiAPIError.swift
//  StudySwiftUI
//
//  Created by 山﨑隼汰 on 2022/10/29.
//

import Foundation

enum YamasakiAPIError: Error {
    case badRequest // 400系
    case forbidden // 403系
    case notFound // 404系
    case internalServerError // 500系
    case decodingError(err: String) // デコードエラー
    case error(err: String) // エラー
    case unknownError // その他
    

    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "構文無効であるためサーバーがリクエストを理解できません"
        case .forbidden:
            return "アクセス権がありません"
        case .notFound:
            return "リソースが発見できません、URLが無効です"
        case .internalServerError:
            return "サーバーが処理できませんでした"
        default:
            return nil
        }
    }
}
