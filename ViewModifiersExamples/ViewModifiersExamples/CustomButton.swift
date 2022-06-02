//
//  CustomButton.swift
//  ViewModifiersExamples
//
//  Created by Ankush  Anand on 29/May/2022.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button(action: {

        }){
            Text("Click Me!")
                .bold()
                .font(.system(size: 16))
                .foregroundColor(.white)

        }
        .padding()
        .buttonStyle(MyButton())
        .modifier(ShadowModifier())
        .animation(Animation.linear.speed(0.7), value: 6)
    }
}

struct ShadowModifier:ViewModifier{
    var color:Color = .cyan
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 1)
            .shadow(color: color.opacity(0.3), radius: 8, x: 1, y: 0)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}

struct MyButton:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.green.opacity(0.8):Color.green.opacity(0.3))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8:1)
            
    }
}
