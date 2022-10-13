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
    
    func fetchMusic() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=エミネム&media=music&entity=musicTrack&country=jp&lang=ja_jp&limit=10") else {
            print("取得に失敗")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([MusicData].self, from: data) {
                musics = decodedResponse
            }
        } catch {
            print("デコードに失敗")
        }
    }
}
