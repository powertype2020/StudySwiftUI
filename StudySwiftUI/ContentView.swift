//
//  ContentVIew.swift
//  StudySwiftUI
//
//  Created by 武久　直幹 on 2022/09/30.
//

import Foundation
import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            StartView()
                .environmentObject(viewModel)
            ButtonView()
                .environmentObject(viewModel)
            Spacer()
        }
    }
    
}

struct NewView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView()
    }
}
