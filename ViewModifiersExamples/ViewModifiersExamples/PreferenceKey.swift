//
//  PreferenceKey.swift
//  ViewModifiersExamples
//
//  Created by Ankush  Anand on 30/May/2022.
//

import SwiftUI

struct PreferenceKeysExample: View {
    @State var text:String="Hello World!"
    var body: some View {
        VStack {
            Text(text)
                .preference(key: CustomPreferences.self,value:"Make Change")
        }
        .onPreferenceChange(CustomPreferences.self) {
            (value:CustomPreferences.Value) in
            text=value

        }

    }
}

struct PreferenceKey_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeysExample()
    }
}

struct CustomPreferences:PreferenceKey{
    static var defaultValue:String=""
    static func reduce(value: inout String, nextValue: () -> String){
        value=nextValue()
    }
}
