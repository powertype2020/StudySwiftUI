//
//  HCustomView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/12.
//

import Foundation
import SwiftUI

struct SerchTextFieldView: View {
    
    @State var name = ""
    @ObservedObject var viewModel = WalkthroughViewModel()
    
    var body: some View {
        TextField("アーティスト、曲名", text: $name)
    }
}

struct ProgressView: View {
    
    var body: some View {
        Image("first")
            .resizable()
            .frame(width: 50.0, height: 50.0)
    }
}

struct ResultListView: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    let musicData: MusicData
    
    var body: some View {
        List {
            HStack {
                AsyncImage(url: musicData.artworkUrl100) { image in
                    
                } placeholder: {
                    ProgressView()
                }
                VStack {
                    Text(musicData.artistName)
                    Text(musicData.trackName)
                }
            }
        }
    }
}

struct SerchMusicView: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    
    var body: some View {
        VStack {
            HStack {
                SerchTextFieldView()
                SerchButtonView()
            }
            ForEach(viewModel.musics, id: \.artistId) { music in
                ResultListView(musicData: music)
            }
            .onAppear(perform: viewModel.fetchMusic)
        }
    }
}
