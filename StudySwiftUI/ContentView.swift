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
            StartView(viewModel: viewModel)
            NextButtonView()
                .environmentObject(viewModel)
            Spacer()
        }
        .background(Color.pink)
    }
    
}

struct WalkthroughView_Previews: PreviewProvider {
    static let viewModel = WalkthroughViewModel()
    static var previews: some View {
        WalkthroughView()
    }
}
