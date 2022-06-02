//
//  Transition.swift
//  ViewModifiersExamples
//
//  Created by Ankush  Anand on 31/May/2022.
//

import SwiftUI

struct RotationModifiers:ViewModifier{
    var rotationValue:Double
    var scale:Double
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)

            .rotationEffect(.degrees(rotationValue))
    }
}

extension AnyTransition{
    static var defaultRotation:AnyTransition{
        .modifier(active: RotationModifiers(rotationValue: 180,scale: 0), identity: RotationModifiers(rotationValue: 0,scale: 1))
        .animation(.easeInOut)
    }
}



struct Transitions: View {
    @State var offsetChange:Bool = false
    var body: some View {
        VStack{
            Spacer()
            if offsetChange{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.saffron)
                    .frame(width: 300, height: 300)

                    //.offset(x: offsetChange ? UIScreen.main.bounds.width-900:0)

                    .transition(AnyTransition.asymmetric(
                                insertion: .defaultRotation,
                                removal:  .offset(x:UIScreen.main.bounds.size.width, y:UIScreen.main.bounds.size.height)))
                    .offset(x:UIScreen.main.bounds.size.width, y:UIScreen.main.bounds.size.height)
                    .onTapGesture {
                        withAnimation{
                            offsetChange.toggle()
                        }
                    }

            }

           // Text("Transition")
            Spacer()
            Button(action: {

                withAnimation(Animation.spring().speed(0.7)){
                    offsetChange.toggle()
                }

            }){
                Text("Transition")
                    .font(.headline)
                    .padding()


            }.buttonStyle(MyButton())
                
            Spacer()
        }
    }
}

struct Transition_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
extension Color{
    public static let saffron: Color=Color("saffron")


}
