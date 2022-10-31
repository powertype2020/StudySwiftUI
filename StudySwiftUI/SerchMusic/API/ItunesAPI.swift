//
//  iTunesAPI.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/20.
//

import Foundation
import SwiftUI

struct ItunesAPI {
    
    func createURL(for serchText: String, limit: Int, offset: Int) -> URL? {
        let baseURL = "https://itunes.apple.com/search?"
        
        let queryItems = [URLQueryItem(name: "term", value: serchText),
                          //URLQueryItem(name: "country", value: "jp"),
                          URLQueryItem(name: "limit", value: String(limit)),
                          URLQueryItem(name: "offset", value: String(offset))]
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}
