//
//  User.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/18/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
