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
    @Published var inputText = CurrentValueSubject<String, Never>("")
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $serchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .dropFirst()
            .sink { [weak self] text in
                self?.fetchMusic(for: text)
        }.store(in: &subscriptions)
    }
    
    
    func fetchMusic(for serchText: String) {
        let serchTextUrlString = "https://itunes.apple.com/search?term=\(serchText)&entity=song&limit=5"
        print(serchTextUrlString)
        guard let url = URL(string: serchTextUrlString) else {
            print("取得に失敗")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let musicData = data {
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode(Response.self, from: musicData) else {
                    print("デコードできません", data as Any)
                    return
                }
                DispatchQueue.main.async {
                    self.results = decodedResponse.results
                }
            } else {
                print("失敗")
            }
        }.resume()
    }
}
