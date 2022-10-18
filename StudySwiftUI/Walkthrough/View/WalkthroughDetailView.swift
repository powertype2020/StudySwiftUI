//
//  Custom.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI


struct WalkthroughDetailView: View {
    
    @ObservedObject var viewModel: WalkthroughViewModel
    
    var body: some View {
        Spacer()
        HStack {
            Button(action: {
                viewModel.backButton()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30))
                    Text("前のページへ戻る")
                }
            }
            .frame(width: 200.0, height: 30.0)
            .disabled(!viewModel.backButtonEnable)
            .padding(.leading, 20.0)
            Spacer()
        }
        Spacer()
        TabView(selection: $viewModel.currentPage) {
            ForEach(viewModel.pageList) {tagNum in
                VStack {
                    Text(tagNum.title)
                        .font(.largeTitle)
                        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    Image(tagNum.imageString)
                        .resizable()
                        .frame(width: 250.0, height: 250.0)
                    Text(tagNum.text)
                        .font(.title2)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onChange(of: viewModel.currentPage) {tagNum in
            viewModel.currentPage = tagNum
            viewModel.toggleBackButton()
            viewModel.toggleNextButtonText()
        }
    }
}
