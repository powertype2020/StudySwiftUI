//
//  APIErrorHandring.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/19.
//

import Foundation

enum APIErrorHandring: Error {
    
    case invalidUrl
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}
