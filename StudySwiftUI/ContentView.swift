//
//  ContentView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/27.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationView {
            ZStack {
            VStack {
                Spacer()
            Text("九月とはいえまだまだ夏です")
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .frame(width: 320.0)
            Text("体調管理には気を使いましょう！")
            Image("first")
                .resizable()
                .frame(width: 300.0, height: 300.0)
            Spacer()
                NavigationLink("次へ", destination: SecondView())
                    .frame(width: 300.0, height: 80.0)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                Spacer()
            }
        }
    }
    }
}

struct SecondView: View {
    var body: some View {
            VStack {
                Spacer()
            Text("日頃の記録を忘れていると…")
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .frame(width: 320.0)
            Text("いつから体調が悪いんだっけ…？")
            Image("second")
                .resizable()
                .frame(width: 300.0, height: 300.0)
            Spacer()
            NavigationLink("次へ", destination: ThirdView())
                    .frame(width: 300.0, height: 80.0)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
            Spacer()
            }
            .padding(.bottom)
    }
}

struct ThirdView: View {
    var body: some View {
            VStack {
                Spacer()
            Text("そんなときにこのアプリ！")
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .frame(width: 320.0)
            Text("さあ！あなたの健康を守りましょう！")
            Image("mamakarute")
                .frame(width: 300.0, height: 260.0)
                .background(Color.pink)
            Spacer()
            NavigationLink("スタート！", destination: StartView())
                    .frame(width: 300.0, height: 80.0)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
            Spacer()
            }
            .padding(.bottom)
    }
}

struct StartView: View {
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            Spacer()
            Image("mamakarute")
                .resizable()
                .frame(width: 300.0, height: 260.0)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
        SecondView()
        ThirdView()
        StartView()
    }
}
