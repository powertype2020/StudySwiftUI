//
//  MusicList.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import SwiftUI

struct MusicList: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    
    var body: some View {
        if(viewModel.toggleMiniPlayerMusicName) {
            ZStack {
                Color.white
                    .cornerRadius(10)
                    .frame(width: 300, height: 50)
                Text("再生中: \(viewModel.previewMusicName)")
                    .frame(width: 280, height: 45)
                    .font(.subheadline)
                    .foregroundColor(Color.black)
            }
        }
        NavigationView {
            VStack {
                switch viewModel.state {
                case .good:
                    Text("検索結果:\(viewModel.serchText)")
                        .foregroundColor(Color.black)
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .loadedAll:
                    Text("検索結果: Empty")
                case .error(let message):
                    Text(message)
                        .foregroundColor(Color.red)
                }
                List {
                    ForEach(viewModel.results, id:\.trackId) { item in
                        HStack {
                            ZStack {
                                AsyncImage(url: URL(string: item.artworkUrl100)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }
                                .frame(width: 120.0, height: 120.0)
                                Image(systemName:"\(viewModel.playImageChange ? "stop.circle" : "play.fill")")
                                    .font(.system(size: 80))
                                    .frame(width: 100.0, height: 100.0)
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        guard viewModel.playImageChange == false else {
                                            viewModel.stopMusic()
                                            return
                                        }
                                        viewModel.startPlayMusic(withUrl: item.previewUrl, withName: item.trackName)
                                    }
                            }
                            Spacer()
                            VStack {
                                Text(item.trackName)
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                Spacer()
                                Text(item.collectionName)
                                    .font(.subheadline)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                Text(item.artistName)
                                    .font(.footnote)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    if viewModel.serchText.isEmpty {
                        HStack {
                            Spacer()
                            Text("No word: 検索してください")
                            Spacer()
                        }
                    } else {
                        Color.clear
                            .onAppear {
                                viewModel.loadMore()
                            }
                    }
                }
                .listStyle(.plain)
                .searchable(text: $viewModel.serchText)
                .foregroundColor(Color.black)
                .navigationTitle("曲検索")
            }
        }
    }
}
