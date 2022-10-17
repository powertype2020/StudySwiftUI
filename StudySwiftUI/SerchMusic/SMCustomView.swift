//
//  SerchMusicCustomView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/16.
//

import Foundation
import SwiftUI

struct SerchTextField: View {
    
    @State var name = ""
    
    var body: some View {
        TextField("アーティスト、曲名", text: $name)
            .frame(width: 200.0, height: 40.0)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct MusicList: View {
    
    var body: some View {
        List {
            ForEach(0..<5) {_ in
                HStack {
                    ZStack {
                        Image("first")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                        PlayButton()
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
}
