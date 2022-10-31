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
        case loadedError
    }
    
    @Published var results = [Results]()
    @Published var errorHandring = APIError.self
    @Published var itunesApi = ItunesAPI()
    @Published var state: State = .good {
        didSet {
            print(state)
        }
    }
    @Published var serchText = ""
    @Published var previewMusicUrl = ""
    @Published var previewMusicName = ""
    @Published var playImageChange = false
    @Published var toggleMiniPlayerMusicName = false
    @Published var selectedValue = false
    private let limit = 20
    private var page = 0
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
        
        guard let requestURL = itunesApi.createURL(for: serchText, limit: limit, offset: limit * page) else { return }
        state = .isLoading
        fetch(to: Response.self, with: requestURL, completion: { result in
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
                case .invalidData:
                    print("データが無効です")
                case .error:
                    self.loadError()
                    print("エラーです: \(error.localizedDescription)")
                case .decodingError(err: _):
                    print("デコードエラーです: \(error.localizedDescription)")
                case .invalidUrl:
                    print("URLが無効です")
                default:
                    print(error.errorDescription ?? "エラー処理を書きます")
                }
            }
        })
        print(requestURL)
    }
    
    func loadError() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.state = .loadedError
        }
    }
    
    func startPlayMusic(withUrl previewUrl: String, withName previewName: String) {
        guard playImageChange == false else {
            return
        }
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
        playImageChange = true
        toggleMiniPlayerMusicName = true
        print(previewMusicUrl)
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        
    }
    
    func stopMusic() {
        audioPlayer?.pause()
        playImageChange = false
        toggleMiniPlayerMusicName = false
    }
}
