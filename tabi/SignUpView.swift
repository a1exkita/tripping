//
//  SignUpView.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

struct SignUpView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @Binding var showSelf: Bool
    
    @EnvironmentObject var session: SessionStore
    
    func signUp () {
        print("sign me up")
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("\(String(describing: error))")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
                self.showSelf = false
            }
        }
    }
    
    var body : some View {
        
        VStack {
            Text("Create an account")
                .font(.title)
                .padding(.all)
            
            CustomInput(text: $email, name: "Email").padding()
            
            VStack{
                SecureField("Password",text: $password).modifier(InputModifier())
                Text("At least 8 characters required.").font(.footnote)
                }.padding(.horizontal)
            
            if (error) {
                InlineAlert(
                    title: "Hmm... That didn't work.",
                    subtitle: "Are you sure you don't already have an account with that email address?"
                ).padding([.horizontal, .top])
               
            }
            
            CustomButton(
                label: "Sign up",
                action: signUp
                )
                .disabled(loading)
                .padding()
            
            Divider()
            
            Text("An account will allow you to save and access recipe information across devices. You can delete your account at any time and your information will not be shared.")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Spacer()
            
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showSelf: .constant(false))

    }
}
