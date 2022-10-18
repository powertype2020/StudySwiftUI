//
//  SerchMusicView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/17.
//

import Foundation
import SwiftUI

struct SerchMusicListView: View {
    
    @ObservedObject var viewModel = SerchMusicViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                SerchTextField(delegate: viewModel)
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
