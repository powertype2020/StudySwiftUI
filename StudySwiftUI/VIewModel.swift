//
//  VIewModel.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/28.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var title = ["はじめまして！","健康管理","最初はヘルプ！","Start!"]
    
    @Published var text = ["このアプリは、あなたやお子さまの健康を考えるアプリです！","病気になりがちな現代、体温や体調などを記録することは大事です。","まずはじめに、カレンダー画面の左下にあるHelpを確認しよう！","使い方は自由です！さあ、始めましょう！"]
    
    }
