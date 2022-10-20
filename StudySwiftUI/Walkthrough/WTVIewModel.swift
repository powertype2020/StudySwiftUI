//
//  VIewModel.swift
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
    
    let pageList = [
        WalkthroughModel(id: 0, title: "はじめまして！", text: "このアプリは、あなたやお子さまの健康を考えるアプリです！", imageString: "first"),
        WalkthroughModel(id: 1, title: "健康管理", text: "病気になりがちな現代、体温や体調などを記録することは大事です。", imageString: "second"),
        WalkthroughModel(id: 2, title: "最初はヘルプ！", text: "まずはじめに、カレンダー画面の左下にあるHelpを確認しよう！", imageString: "third"),
        WalkthroughModel(id: 3, title: "Start!", text: "使い方は自由です！さあ、始めましょう！", imageString: "mamakarute")
    ]
    
    func nextButton() {
        if currentPage <= pageList.count - 2 {
            currentPage += 1
            print(currentPage)
        } else if currentPage == pageList.count - 1 {
            //ここにmamakaruteのスタート画面への処理を書く
            print("もう押せません")
            print(pageList.count)
        }
    }
    
    func backButton() {
        if currentPage >= 1 {
            currentPage -= 1
            print(currentPage)
        } else {
            print("もう押せません")
        }
    }
    
    func toggleBackButton() {
        if currentPage >= 1 {
            backButtonEnable = true
        } else {
            backButtonEnable = false
        }
    }
    
    func toggleNextButtonText() {
        if currentPage == pageList.count - 1 {
            nextButtonTextChange = true
        } else {
            nextButtonTextChange = false
        }
    }
}
