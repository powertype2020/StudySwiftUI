//
//  Custom.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI

struct TitleView: View {
    
    var string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var body: some View {
        Text(self.string)
            .font(.largeTitle)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ImageView: View {
    
    var string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var body: some View {
        Image(self.string)
            .resizable()
            .frame(width: 300.0, height: 300.0)
    }
}

struct TextView: View {
    
    var string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var body: some View {
        Text(self.string)
            .font(.title2)
    }
}

struct ButtonView: View {
    
    @Binding var tagNum: Int
    var newView = NewView()
    
    var body: some View {
        if tagNum <= 2 {
        Button("次へ") {
            tagNum += 1
        }
        .frame(width: 300.0, height: 50.0)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(50)
        } else if tagNum == 3 {
            Button("スタート！") {
                
            }
            .frame(width: 300.0, height: 50.0)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(50)
        }
    }
}
