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
    @State var musics = [MusicData]()
    
    var body: some View {
        List(musics, id: \.trackId) { music in
            HStack {
                AsyncImage(url: music.artworkUrl100) { image in
                } placeholder: {
                    ProgressView()
                }
                VStack {
                    Text(music.artistName)
                    Text(music.trackName)
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
                Spacer()
                SerchTextFieldView()
                    .frame(width: 200.0, height: 40.0)
                    .background(Color.white)
                SerchButtonView()
                    .frame(width: 40.0, height: 40.0)
                    .foregroundColor(Color.blue)
                Spacer()
            }
            .padding(.top, 20.0)
            ResultListView()
            Spacer()
        }
    }
}

struct SerchMusicView_Previews: PreviewProvider {
    static let viewModel = WalkthroughViewModel()
    static var previews: some View {
        SerchMusicView()
    }
}
