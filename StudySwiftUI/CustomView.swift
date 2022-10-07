//
//  Custom.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI


struct StartView: View {
    
    @ObservedObject var viewModel: WalkthroughViewModel
    
    var body: some View {
        HStack {
            BackButtonView()
                .environmentObject(viewModel)
                .padding(.leading, 20.0)
                .padding(.top, 50.0)
            Spacer()
        }
        TabView(selection: $viewModel.currentPage) {
            ForEach(viewModel.pageList) {tagNum in
        VStack {
            Text(tagNum.title)
                .font(.largeTitle)
                .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
            Image(tagNum.imageString)
                .resizable()
                .frame(width: 300.0, height: 300.0)
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
