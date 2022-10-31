//
//  ViewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/28.
//

import Foundation
import SwiftUI

class WalkthroughViewModel: ObservableObject {
    
    @Published var currentPage = 0
    @Published var backButtonEnable = false
    @Published var nextButtonTextChange = false
    @Published var nextSerchMusic = false
    
    let pageList = [
        WalkthroughModel(id: 0, title: "はじめまして！", text: "このアプリは、あなたやお子さまの健康を考えるアプリです！", imageString: "first"),
        WalkthroughModel(id: 1, title: "健康管理", text: "病気になりがちな現代、体温や体調などを記録することは大事です。", imageString: "second"),
        WalkthroughModel(id: 2, title: "最初はヘルプ！", text: "まずはじめに、カレンダー画面の左下にあるHelpを確認しよう！", imageString: "third"),
        WalkthroughModel(id: 3, title: "Start!", text: "使い方は自由です！さあ、始めましょう！", imageString: "mamakarute")
    ]
    
    func nextButton() {
        let lastPageIndex = pageList.count - 1
        guard currentPage < lastPageIndex else {
            nextSerchMusic = true
            return
        }
        currentPage += 1
        print(currentPage)
    }
    
    func backButton() {
        guard currentPage >= 1 else {
            return
        }
        currentPage -= 1
        print(currentPage)
    }
    
    func toggleBackButton() {
        let isFirstPageOrMore = currentPage >= 1
        backButtonEnable = isFirstPageOrMore
    }
    
    func toggleNextButtonText() {
        let secondLastPageIndex = pageList.count - 2
        let islastPageOrMore = currentPage > secondLastPageIndex
        nextButtonTextChange = islastPageOrMore
    }
}
