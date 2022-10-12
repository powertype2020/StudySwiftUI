//
//  HViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/12.
//

import Foundation

class SerchMusicViewModel: ObservableObject {
    
    @Published var serchText = ""
    @Published var musics: [MusicData] = []
    
    func fetchMusic() {
        let itunesUrlString = "https://itunes.apple.com/search?term=\(serchText)&media=music&entity=music&country=jp&lang=ja_jp&limit=10"
        if let url = URL(string: itunesUrlString) {
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    if let error = error {
                        
                    } else {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let musics = try? decoder.decode([MusicData].self, from: data) {
                            self?.musics = musics
                        } else {
                            
                        }
                    }
                }.resume()
        }
        
    }
    
}
