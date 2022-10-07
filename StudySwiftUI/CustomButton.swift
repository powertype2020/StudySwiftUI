//
//  CustomButton.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/10/07.
//

import Foundation
import SwiftUI


struct NextButtonView: View {
    
    @EnvironmentObject var viewModel: WalkthroughViewModel
    
    var body: some View {
        Button("\(viewModel.nextButtonTextChange ? "スタート！": "次へ")") {
                    viewModel.nextButton()
                }
                .frame(width: 300.0, height: 50.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(50)
        }
    }

struct BackButtonView: View {
    
    @EnvironmentObject var viewModel: WalkthroughViewModel
    
    var body: some View {
        Button(action: {
            viewModel.backButton()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 50))
                Text("前のページへ戻る")
            }
        }
        .frame(width: 200.0, height: 50.0)
        .disabled(!viewModel.backButtonEnable)
        }
}
