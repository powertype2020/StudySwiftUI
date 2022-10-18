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
        List(viewModel.results, id:\.trackId) { item in
            HStack {
                ZStack {
                    AsyncImage(url: URL(string: item.artworkUrl100)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
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
                Spacer()
            }
        }
        .onAppear() {
            viewModel.fetchMusic()
        }
    }
}

struct ProgressView: View {
    
    var body: some View {
        Image("first")
            .resizable()
            .frame(width: 120.0, height: 120.0)
    }
}
