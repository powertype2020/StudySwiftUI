//
//  Model.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/28.
//

import Foundation

class Model1: ObservableObject {
    
    @Published var title = "はじめまして！"
    @Published var text = "このアプリは、あなたやお子さまの健康を考えるアプリです！"
    
}

class Model2: ObservableObject {
    
    @Published var title = "健康管理"
    @Published var text = "病気になりがちな現代、体温や体調などを記録することは大事です。"
}

class Model3: ObservableObject {
    
    @Published var title = "最初はヘルプ！"
    @Published var text = "まずはじめに、カレンダー画面の左下にあるHelpを確認しよう！"
    
}

class Model4: ObservableObject {
    
    @Published var title = "Start!"
    @Published var text = "使い方は自由です！さあ、始めましょう！"
}
