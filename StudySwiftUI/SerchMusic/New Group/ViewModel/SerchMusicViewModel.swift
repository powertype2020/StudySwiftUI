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
    @Published var errorHandring = APIError.self
    @Published var genericAPIMethod = GenericAPIMethod()
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
                self?.fetchMusic()
            }.store(in: &subscriptions)
    }
    
    func loadMore() {
        fetchMusic()
    }
    
    func fetchMusic() {
        
        guard !serchText.isEmpty else {
            return
        }
        
        guard state == State.good else {
            return
        }
        
        guard let requestURL = iTunesApi.createURL(for: serchText, limit: limit, offset: limit * page) else { return }
        state = .isLoading
        genericAPIMethod.fetch(to: Response.self, with: requestURL, completion: { result in
            switch(result) {
            case let .success(json):
                dump(json)
                DispatchQueue.main.async {
                    for result in json.results {
                        self.results.append(result)
                    }
                    self.page += 1
                    self.state = (json.results.count == self.limit) ? .good : .loadedAll
                }
            case let .failure(error):
                switch error {
                case let .invalidResponse(statusCode):
                    switch statusCode {
                    case 400:
                        print("statusCode \(statusCode): 構文無効であるためサーバーがリクエストを理解できません")
                    case 403:
                        print("statusCode \(statusCode): アクセス権がありません")
                    case 404:
                        print("statusCode \(statusCode): リソースが発見できません、URLが無効です")
                    case 500:
                        print("statusCode \(statusCode): サーバーが処理できませんでした")
                    default:
                        print("statusCode \(statusCode): その他のエラーです")
                    }
                case .invalidData:
                    print("データが無効です")
                case .error:
                    print("エラーです: \(error.localizedDescription)")
                case .decodingError(err: _):
                    print("デコードエラーです: \(error.localizedDescription)")
                case .invalidUrl:
                    print("URLが無効です")
                }
            }
        })
        print(requestURL)
    }
}
