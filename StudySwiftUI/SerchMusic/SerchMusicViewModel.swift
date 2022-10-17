//
//  SMViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation

class SerchMusicViewModel: ObservableObject, MyProtocol {
    
    @Published var results = [Results]()
    @Published var serchText = ""
    
    func fetchMusic() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=Eminem&entity=song") else {
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
