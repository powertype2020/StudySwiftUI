//
//  SerchMusicCustomView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/16.
//

import Foundation
import SwiftUI

struct ProvisionalSerchTextField: View {
    
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
                Spacer()
            }
        }
    }
}

struct ProvisionalMusicListView: View {
    
    var body: some View {
        List {
            ForEach(0..<5) {_ in
                HStack {
                    Image("first")
                        .resizable()
                        .frame(width: 150.0, height: 150.0)
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
