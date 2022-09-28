//
//  ContentView.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/27.
//

import SwiftUI

struct FirstView: View {
    
    @State var currentPage = 0
    @State private var offset: CGFloat = 0
    @State private var index: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("題名")
                .font(.largeTitle)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                Image("first").resizable()
                            }
            .content.offset(x: self.offset)
                        .frame(width: geometry.size.width, height: nil, alignment: .leading)
                        .gesture(DragGesture()
                            .onChanged({ value in
                                self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                            })
                            .onEnded({ value in // 4. Dragが完了したら、Drag量に応じて、indexを更新
                                let scrollThreshold = geometry.size.width / 2
                                if value.predictedEndTranslation.width < -scrollThreshold {
                                    if currentPage <= 3 {
                                    currentPage += 1
                                    }
                                } else if value.predictedEndTranslation.width > scrollThreshold {
                                    if currentPage >= 1 {
                                    currentPage -= 1
                                    }
                                }
                            })
                        )
        }
        .frame(width: 300.0, height: 300.0)
            Text("ここにViewModelからの変数")
                .font(.title)
                .padding(.horizontal)
            Spacer()
            pageControl(current: currentPage)
            Button(action: {
                if currentPage < 4 {
                currentPage += 1
                    print(currentPage)
                }
            }) {
                Text("次へ")
                    .font(.title)
            }
            .frame(width: 300.0, height: 70.0)
            .foregroundColor(Color.white)
            .background(Color.pink)
            .cornerRadius(50)
            Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct pageControl: UIViewRepresentable {
    
    var current = 0
    
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.numberOfPages = 5
        page.pageIndicatorTintColor = .gray
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = current
    }
    
    
    
}
