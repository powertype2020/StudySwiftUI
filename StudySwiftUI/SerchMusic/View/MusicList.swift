//
//  SerchMusicCustomView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/16.
//

import Foundation
import SwiftUI


struct MusicList: View {
    
    var body: some View {
        List {
            ForEach(0..<5) {_ in
                HStack {
                    ZStack {
                        Image("first")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                        musicPlayButton
                    }
                    Spacer()
                    VStack {
                        Text("曲名")
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Spacer()
                        Text("アルバム名")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        Text("アーティスト名")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                }
            }
        }
    }
    
    private var musicPlayButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "play.fill")
                .font(.system(size: 100))
        }
        .frame(width: 130.0, height: 130.0)
        .foregroundColor(Color.white)
    }
}
