//
//  VIew.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI

struct NewView: View {
    
    var currentPage = 0
    let viewModel = ViewModel()
    
    var body: some View {
        VStack {
        TabView {
            VStack {
                TitleView(viewModel.model.title[0])
                ImageView(viewModel.model.imageString[0])
                TextView(viewModel.model.text[0])
            }
            VStack {
                TitleView(viewModel.model.title[1])
                ImageView(viewModel.model.imageString[1])
                TextView(viewModel.model.text[1])
            }
            VStack {
                TitleView(viewModel.model.title[2])
                ImageView(viewModel.model.imageString[2])
                TextView(viewModel.model.text[2])
            }
            VStack {
                TitleView(viewModel.model.title[3])
                ImageView(viewModel.model.imageString[3])
                    .background(Color.pink)
                TextView(viewModel.model.text[3])
            }
        }
        .tabViewStyle(PageTabViewStyle())
        ButtonView("次へ")
            Spacer()
        }
    }
    
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
