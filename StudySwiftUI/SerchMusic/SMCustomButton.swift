//
//  SMCustomButton.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import SwiftUI

struct PlayButton: View {
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "play.fill")
                .font(.system(size: 100))
        }
        .frame(width: 130.0, height: 130.0)
        .foregroundColor(Color.white)
    }
}

struct SerchButton: View {
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 30))
        }
        .frame(width: 40.0, height: 40.0)
        .foregroundColor(Color.blue)
    }
}

struct DismissButton: View {
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "clear.fill")
                .font(.system(size: 30))
        }
        .padding([.top, .leading], 30.0)
        .frame(width: 30.0, height: 30.0)
        .foregroundColor(Color.gray)
    }
}
