//
//  APIErrorHandring.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/19.
//

import Foundation

enum APIError: Error {
    
    case invalidUrl
    case invalidResponse(Int)
    case invalidData
    case error(err: String)
    case decodingError(err: String)
    
}
