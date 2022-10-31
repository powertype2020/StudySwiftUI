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
        MusicList()
            .padding(.top, 50.0)
    }
}

struct SerchMusicListView_Previews: PreviewProvider {
    static var previews: some View {
        SerchMusicListView()
    }
}
