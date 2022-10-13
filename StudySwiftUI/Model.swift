//
//  Model.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/28.
//

import Foundation

struct WTModel: Identifiable, Hashable {
    
    let id: Int
    let title: String
    let text: String
    let imageString: String
    
}

struct MusicData: Codable {
    
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let artworkUrl100: URL
    
}
