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
            Button("\(viewModel.nextButtonTextChange ? "スタート！": "次へ")") {
                viewModel.nextButton()
            }
            .sheet(isPresented: self.$viewModel.nextSerchMusic) {
                SerchMusicListView()
            }
            .frame(width: 300.0, height: 50.0)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(50)
            .padding(.bottom)
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
