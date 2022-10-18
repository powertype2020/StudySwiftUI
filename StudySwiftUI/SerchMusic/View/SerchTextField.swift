//
//  SerchTextField.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/16.
//

import Foundation
import SwiftUI

struct SerchTextField: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    
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
                TextField("アーティスト、曲名", text: $viewModel.inputText.value)
                    .onAppear {
                        
                    }
                    .frame(width: 180.0, height: 40.0)
                    .foregroundColor(Color.black)
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
        }
    }
}
