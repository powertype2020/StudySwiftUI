//
//  SMViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import Combine

class SerchMusicViewModel: ObservableObject {
    
    enum State: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }
    
    @Published var results = [Results]()
    @Published var errorHandring = APIErrorHandring.self
    @Published var iTunesApi = iTunesAPI()
    @Published var state: State = .good {
        didSet {
            print(state)
        }
    }
    @Published var serchText = ""
    let limit = 20
    var page = 0
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $serchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .dropFirst()
            .sink { [weak self] text in
                self?.state = .good
                self?.results = []
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
        
        guard state == State.good else {
            return
        }
        
        guard let url = iTunesApi.createURL(for: serchText, limit: limit, offset: limit * page) else {
            print("取得に失敗")
            return
        }
        print("検索を開始しました　for: \(serchText)")
        state = .isLoading
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
            DispatchQueue.main.async {
                self?.state = .error("ロード失敗")
            }
            
            if let response = response as? HTTPURLResponse {
                print("statusCode : \(response.statusCode)")
            }
            
            } else if let musicData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: musicData)
                    DispatchQueue.main.async {
                        for result in decodedResponse.results {
                            self?.results.append(result)
                        }
                        self?.page += 1
                        self?.state = (decodedResponse.results.count == self?.limit) ? .good : .loadedAll
                    }
                } catch {
                    print("error: \(error)")
                }
            }
        }.resume()
    }
}
