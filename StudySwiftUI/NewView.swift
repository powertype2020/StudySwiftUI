//
//  VIew.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI

struct NewView: View {

    @ObservedObject var viewModel = ViewModel()
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<viewModel.model.title.count) {index in
            VStack {
                TitleView(viewModel.model.title[index])
                ImageView(viewModel.model.imageString[index])
                TextView(viewModel.model.text[index])
                    .tag(index)
            }
            }
        }
        .tabViewStyle(PageTabViewStyle())
            ButtonView(tagNum: $currentPage)
            Spacer()
        }
    }
    
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
