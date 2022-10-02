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
    
    var string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var body: some View {
        Button(self.string) {
            var newView = NewView()
            newView.currentPage += 1
        }
        .frame(width: 300.0, height: 50.0)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(50)
    }
}
