//
//  SMViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import Combine

class SerchMusicViewModel: ObservableObject {
    
    @Published var results = [Results]()
    @Published var serchText = ""
    let limit: Int = 20
    var page: Int = 0
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $serchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .dropFirst()
            .sink { [weak self] text in
                self?.fetchMusic(for: text)
        }.store(in: &subscriptions)
    }
    
    func loadMore() {
        fetchMusic(for: serchText)
    }
    
    
    func fetchMusic(for serchText: String) {
        
        guard !serchText.isEmpty else {
            return
        }
        
        let offset = page * limit
        let serchTextUrlString = "https://itunes.apple.com/search?term=\(serchText)&entity=song&limit=\(limit)&offset=\(offset)"
        print(serchTextUrlString)
        guard let url = URL(string: serchTextUrlString) else {
            print("取得に失敗")
            return
        }
        print("検索を開始しました　for: \(serchText)")
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let musicData = data {
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode(Response.self, from: musicData) else {
                    print("デコードできません", data as Any)
                    return
                }
                DispatchQueue.main.async {
                    for result in decodedResponse.results {
                        self.results.append(result)
                    }
                    self.page += 1
                }
            } else {
                print("error: \(error?.localizedDescription ?? "unkownError")")
            }
        }.resume()
    }
}
