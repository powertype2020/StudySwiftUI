//
//  HCustomButton.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/12.
//

import Foundation
import SwiftUI

struct SerchButtonView: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    
    var body: some View {
        
        Button(action: {
            Task {
                await viewModel.fetchMusic()
            }
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 30))
        }
    }
    
}
