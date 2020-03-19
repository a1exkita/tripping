//
//  CustomInoput.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

struct InputModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .border(Color(red: 0, green: 0, blue: 0, opacity: 0.15), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .cornerRadius(5)
    }
}

struct CustomInput : View {
    @Binding var text: String
    var name: String
    
    var body: some View {
        TextField(name, text: $text)
            .modifier(InputModifier())
        
    }
}

#if DEBUG
struct CustomInput_Previews : PreviewProvider {
    
    static var previews: some View {
        CustomInput(text: .constant(""), name: "Some name")
            .padding()
    }
}
#endif
