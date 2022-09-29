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
    @State var modelArray:[String] = []
    
    
    var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.title[currentPage])
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                switch currentPage {
                case 0: Image("first").resizable()
                case 1: Image("second").resizable()
                case 2: Image("third").resizable()
                case 3: Image("mamakarute").resizable().background(Color.pink)
                default:
                    Image("first").resizable()
                }
                            }
            .content.offset(x: self.offset)
                        .frame(width: geometry.size.width, height: nil, alignment: .leading)
                        .gesture(DragGesture()
                            .onChanged({ value in
                                self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                            })
                            .onEnded({ value in
                                let scrollThreshold = geometry.size.width / 2
                                if value.predictedEndTranslation.width < -scrollThreshold {
                                    if currentPage <= 2 {
                                    currentPage += 1
                                    }
                                } else if value.predictedEndTranslation.width > scrollThreshold {
                                    if currentPage >= 1 {
                                    currentPage -= 1
                                    }
                                }
                            withAnimation {
                                self.offset = -geometry.size.width * CGFloat(self.index)
                                                }
                            })
                        )
        }
        .frame(width: 300.0, height: 300.0)
            Spacer()
            Text(viewModel.text[currentPage])
                .font(.title)
                .padding(.horizontal)
            Spacer()
            pageControl(current: currentPage)
            Button(action: {
                if currentPage < 3 {
                currentPage += 1
                    print(currentPage)
                }
            }) {
                if currentPage < 3 {
                Text("次へ")
                    .font(.title)
                } else if currentPage == 3 {
                    Text("スタート！")
                        .font(.title)
                }
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
        page.numberOfPages = 4
        page.pageIndicatorTintColor = .gray
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = current
    }
    
    
    
}
