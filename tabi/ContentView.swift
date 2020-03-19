//
//  ContentView.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/4/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    @State var signInSuccess = false
    
    
    func getUser () {
        session.listen()
    }
    
    var body: some View{
        Group {
            if signInSuccess && session.session != nil {
                AppHomeView(posts: testData)
            } else {
                SignInView(signInSuccess: $signInSuccess)
            }
        }.onAppear(perform: getUser)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
