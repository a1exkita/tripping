
//
//  SwiftUIView.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/5/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

struct Post : Identifiable {
    var id = UUID()
    var name: String
    var gender: String
    var age: Int
    var nationality: String
    var lang: String
    var usernameIG: String

    var title: String
    var message: String
    var party: Int
    var hasVideo: Bool = false
    var createdDate: Date

    var imageName: String {return name}
    var thumbnailName: String {return name + "Thumb"}
}

#if DEBUG
let current = Date()
let testData = [
    Post(name: "John", gender: "Male", age: 24,
         nationality: "🇬🇧", lang: "EN", usernameIG: "at_north",
         title: "Hang out tonight in Kyoto?",
         message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
         party: 2, hasVideo: true,
         createdDate: type(of: current).init()),
    Post(name: "Kathy", gender: "Female", age: 20,
         nationality: "🇫🇷", lang: "EN", usernameIG: "at_north",
         title: "Wanna smoke shisha in Umeda?",
         message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
         party: 3, hasVideo: false,
         createdDate: type(of: current).init())
]
#endif
