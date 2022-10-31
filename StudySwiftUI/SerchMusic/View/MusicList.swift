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
            VStack {
                AsyncImage(url: URL(string: viewModel.previewMusicImage)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                .frame(width: 180.0, height: 180.0)
                Text("再生中")
                    .font(.headline)
                    .foregroundColor(Color("TextColor"))
                Text("\(viewModel.previewMusicName)")
                    .frame(width: 280, height: 45)
                    .font(.subheadline)
                    .foregroundColor(Color("TextColor"))
                Image(systemName: "stop.circle")
                    .font(.system(size: 80))
                    .frame(width: 100.0, height: 100.0)
                    .foregroundColor(Color("TextColor"))
                    .onTapGesture {
                        viewModel.stopMusic()
                    }
                Text("stop Music")
                    .font(.subheadline)
                    .foregroundColor(Color("TextColor"))
            }
        }
        NavigationView {
            VStack {
                switch viewModel.state {
                case .good:
                    Text("検索結果:\(viewModel.serchText)")
                        .foregroundColor(Color("TextColor"))
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .loadedAll:
                    Text("検索結果: Empty")
                        .foregroundColor(Color("TextColor"))
                case .error(let message):
                    Text(message)
                        .foregroundColor(Color.red)
                case .loadedError:
                    Text("検索できませんでした: URLが無効の可能性があります")
                        .foregroundColor(Color.red)
                }
                if viewModel.serchText.isEmpty {
                    HStack {
                        Spacer()
                        Text("No word: 検索してください")
                            .foregroundColor(Color("TextColor"))
                        Spacer()
                    }
                } else {
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
                                    if viewModel.playImageChange == false {
                                        Image(systemName: "play.fill")
                                            .font(.system(size: 80))
                                            .frame(width: 100.0, height: 100.0)
                                            .foregroundColor(Color.white)
                                            .onTapGesture {
                                                guard viewModel.playImageChange == false else {
                                                    viewModel.stopMusic()
                                                    return
                                                }
                                                viewModel.startPlayMusic(withUrl: item.previewUrl, withName: item.trackName, withImage: item.artworkUrl100)
                                            }
                                    }
                                }
                                Spacer()
                                VStack {
                                    Text(item.trackName)
                                        .font(.headline)
                                        .foregroundColor(Color("TextColor"))
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                    Text(item.collectionName)
                                        .font(.subheadline)
                                        .foregroundColor(Color("TextColor"))
                                        .multilineTextAlignment(.center)
                                    Text(item.artistName)
                                        .font(.footnote)
                                        .foregroundColor(Color("TextColor"))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        Color.clear
                            .onAppear {
                                viewModel.loadMore()
                            }
                    }
                    .listStyle(.plain)
                }
            }
            .searchable(text: $viewModel.serchText)
            .navigationTitle("曲検索")
            .foregroundColor(Color("TextColor"))
        }
    }
}
