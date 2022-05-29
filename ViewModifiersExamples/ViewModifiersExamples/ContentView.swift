//
//  ContentView.swift
//  ViewModifiersExamples
//
//  Created by Ankush  Anand on 29/May/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, world!")
                    .modifier(CustomViewModifiers())
                    
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
