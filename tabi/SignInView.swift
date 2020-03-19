//
//  SignInView.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI

struct SignInView : View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    @State var showDetail = false

    @Binding var signInSuccess: Bool
        
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
                self.signInSuccess = true
            }
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                Group {
                    Image("tripping-logo")
                        .resizable()
                        .frame(width: 75, height: 75)
                    Text("Tripping").font(.title).padding(.bottom)
                    Text("A new way to trip around the world.")
                        .font(.subheadline)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                Spacer()
                Group {
                    Divider()
                    Group{
                        CustomInput(text: $email, name: "Email")
                            .padding()
                        SecureField("Password", text: $password)
                            .modifier(InputModifier())
                            .padding([.leading, .trailing])
                    }
                    if (error) {
                        InlineAlert(
                            title: "Hmm... That didn't work.",
                            subtitle: "Please check your email and password and try again"
                            ).padding([.horizontal, .top])
                        
                    }
                    CustomButton(
                        label: "Sign in",
                        action: signIn,
                        loading: loading
                    )
                    .padding()
                }
                VStack {
                    Divider()
                    HStack(alignment: .center) {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        
                        NavigationLink(destination: SignUpView(showSelf: $showDetail), isActive: $showDetail) {
                            Text("Sign up.").font(.footnote)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#if DEBUG
struct SignInView_Previews : PreviewProvider {
    static var previews: some View {
        SignInView(signInSuccess: .constant(false))
            .environmentObject(SessionStore())
    }
}
#endif

//import SwiftUI
//
//struct SignInView : View {
//
//    @State var email: String = ""
//    @State var password: String = ""
//    @State var loading = false
//    @State var error = false
//
//    @EnvironmentObject var session: SessionStore
//
//    func signIn () {
//        loading = true
//        error = false
//        session.signIn(email: email, password: password) { (result, error) in
//            self.loading = false
//            if error != nil {
//                self.error = true
//            } else {
//                self.email = ""
//                self.password = ""
//            }
//        }
//    }
//
//    var body: some View {
//        VStack {
//            TextField("email address", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            if (error) {
//                Text("ahhh crap")
//            }
//            Button(action: signIn) {
//                Text("Sign in")
//            }
//        }
//    }
//}
//
//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
