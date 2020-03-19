//
//  CustomButton.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

struct CustomButton : View {
    var label: String
    var action: () -> Void
    var loading: Bool = false
    
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(label)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
        }
        .padding()
        .background(loading ? Color.blue.opacity(0.3) : Color.blue)
        .cornerRadius(5)
    }
}

#if DEBUG
struct CustomButton_Previews : PreviewProvider {
    static var previews: some View {
        CustomButton(label: "Sign in", action: {
            print("hello")
        })
    }
}
#endif
