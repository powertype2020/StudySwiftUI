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
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 80))
                                }
                                .frame(width: 100.0, height: 100.0)
                                .foregroundColor(Color.white)
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
                    .listStyle(.plain)
                    .searchable(text: $viewModel.serchText)
                    .foregroundColor(Color.black)
                    .navigationTitle("曲検索")
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                }
            }
        }
    }
}
