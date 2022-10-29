//
//  MusicResult.swift
//  StudySwiftUI
//
//  Created by 山﨑隼汰 on 2022/10/29.
//

import Foundation

struct MusicResult: Decodable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let collectionName: String
    let artworkUrl100: String
    let previewUrl: String
}
