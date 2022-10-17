//
//  SMModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation

// MARK: - MusicData
struct Response: Codable {
    let results: [Results]
}

struct Results: Codable {
    
    let trackId: Int
    let artistName: String
    let trackName: String
    let collectionName: String
    let artworkUrl100: String
    
    enum CodingKeys: String, CodingKey {
        
        case trackId
        case artistName
        case trackName
        case collectionName
        case artworkUrl100
    }
}


struct SerchData: Codable {
    
    let wrapperType: String
    let artistID, collectionID: Int
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL, collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Int
    let copyright: String?
    let country: String
    let currency: String
    let releaseDate: Date
    let primaryGenreName: String
    let previewURL: String
    let resultDescription, kind: String?
    let trackID: Int?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let artworkUrl30: String?
    let trackPrice: Double?
    let trackExplicitness: String
    let discCount, discNumber, trackNumber, trackTimeMillis: Int?
    let contentAdvisoryRating: String?
    let isStreamable: Bool?

    enum CodingKeys: String, CodingKey {
        
        case wrapperType
        case artistID
        case collectionID
        case artistName, collectionName, collectionCensoredName
        case artistViewURL
        case collectionViewURL
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
        case previewURL
        case resultDescription
        case kind
        case trackID
        case trackName, trackCensoredName
        case trackViewURL
        case artworkUrl30, trackPrice, trackExplicitness, discCount, discNumber, trackNumber, trackTimeMillis, contentAdvisoryRating, isStreamable
    }
}
