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

final class _Box<Value> {
    var value: Value
    init(_ value: Value) {
        self.value = value
    }
}

/*
var user: User = .init(name: "Swift", age: 8)
let keyPath: KeyPath<User, Int> = \.age // read only
let writableKeyPath: WritableKeyPath<User, Int> = \.age

let age = user[keyPath: keyPath]
user[keyPath: writableKeyPath] = 9
*/

/*
let a: _Box<User> = .init(User(name: "Swift", age: 8))
let age = a.value.age
*/

// MARK: KeyPathMemberLookup

@dynamicMemberLookup
final class Box<Value> {
    var value: Value
    
    init(_ value: Value) {
        self.value = value
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> T {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
}

/*
let a: Box<User> = .init(User(name: "Swift", age: 8))
let age = a.age
*/
