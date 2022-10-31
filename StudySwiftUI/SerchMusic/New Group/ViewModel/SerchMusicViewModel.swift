//
//  SMViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import Combine
import AVFAudio
import AVFoundation

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
    @Published var previewMusicUrl = ""
    @Published var previewMusicName = ""
    @Published var selectedMusic: Results?
    @Published var toggleMiniPlayerMusicName = false
    let limit = 20
    var page = 0
    var audioPlayer: AVPlayer?
    
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
    
    func startPlayMusic(withUrl previewUrl: String, withName previewName: String, music: Results) {
        
        let url = previewUrl
        let name = previewName
        previewMusicName = name
        let audioPlayerUrl = URL(string: url)
        guard audioPlayerUrl != nil else { return }
        audioPlayer = AVPlayer.init(playerItem: AVPlayerItem(url: audioPlayerUrl!))
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: audioPlayer?.currentItem)
        
        Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { timer in
            if let audioPlayer = self.audioPlayer,
               let currentItem = audioPlayer.currentItem,
               currentItem.status == .readyToPlay {
                //let timeElapsed = CMTimeGetSeconds(audioPlayer.currentTime())
                //let timeDuration = currentItem.duration.seconds
            }
        }
        audioPlayer?.play()
        selectedMusic = music
        toggleMiniPlayerMusicName = true
        print(previewMusicUrl)
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
    }
    
    func stopMusic() {
        audioPlayer?.pause()
        selectedMusic = nil
        toggleMiniPlayerMusicName = false
    }
}

// MARK: yamasakiリファクタ用
extension SerchMusicViewModel {

    func fetchMusic2() {
        let request = MusicRequest(serchText: serchText, limit: limit, offset: limit*page)
        APIRequestProvider.request(request, completion: { result in
            switch(result) {
            case let .success(result):
                // 成功した時の処理
                dump(result)
            case let .failure(error):
                // エラー処理をごちゃごちゃする
                print(error.errorDescription ?? "エラー処理を書きます")
            }
        })
    }
}
