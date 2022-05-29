//
//  CustomViewModifiers.swift
//  ViewModifiersExamples
//
//  Created by Ankush  Anand on 29/May/2022.
//

import SwiftUI

struct CustomViewModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.background(Color.red)
            .foregroundColor(.green)
            .frame(width: 100, height: 100)

    }
}

