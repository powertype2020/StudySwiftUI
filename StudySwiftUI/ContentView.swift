//
//  ContentVIew.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI

struct WalkthroughView: View {
    
    @ObservedObject var viewModel = WalkthroughViewModel()
    
    var body: some View {
        VStack {
            WalkthroughDetailView(viewModel: viewModel)
            Spacer()
            NextButtonView(viewModel: viewModel)
                .padding(.bottom)
        }
        .background(Color.pink)
    }
}

struct HomeView: View {
    
    var body: some View {
        SerchMusicView()
            .background(Color.red)
    }
}


struct WalkthroughView_Previews: PreviewProvider {
    static let viewModel = WalkthroughViewModel()
    static var previews: some View {
        WalkthroughView()
        HomeView()
    }
}
