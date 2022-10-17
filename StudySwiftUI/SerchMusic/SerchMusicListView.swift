//
//  SMView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import SwiftUI

struct SerchMusicListView: View {
    
    @State var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "clear.fill")
                        .font(.system(size: 30))
                }
                .padding([.top, .leading], 30.0)
                .frame(width: 30.0, height: 30.0)
                .foregroundColor(Color.gray)
                Spacer()
            }
            HStack {
                Spacer()
                HStack {
                    TextField("アーティスト、曲名", text: $name)
                        .frame(width: 200.0, height: 40.0)
                        .background(Color.white)
                        .cornerRadius(10)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30))
                    }
                    .frame(width: 40.0, height: 40.0)
                    .foregroundColor(Color.blue)
                }
                Spacer()
            }
            MusicList()
        }
    }
}

struct SerchMusicListView_Previews: PreviewProvider {
    static var previews: some View {
        SerchMusicListView()
    }
}
