//
//  User.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2022/7/16.
//  Copyright © 2022 shusuke. All rights reserved.
//

// KeyPath練習用

import Foundation

struct User {
    var name: String
    var age: Int
}

/*
var user: User = .init(name: "Swift", age: 8)
let keyPath: KeyPath<User, Int> = \.age // read only
let writableKeyPath: WritableKeyPath<User, Int> = \.age

let age = user[keyPath: keyPath]
user[keyPath: writableKeyPath] = 9
*/
