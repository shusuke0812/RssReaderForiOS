//
//  JSON.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2022/7/16.
//  Copyright © 2022 shusuke. All rights reserved.
//

// Ref1: https://www.json.org/json-en.html
// Ref2: Swift Zoomin' #11(https://swift-tweets.connpass.com/event/245955/)

import Foundation

@dynamicMemberLookup
enum JSON: ExpressibleByDictionaryLiteral, ExpressibleByArrayLiteral, ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, ExpressibleByNilLiteral, ExpressibleByBooleanLiteral {
    case object([String: JSON]) // { "A": 2, "B": true }
    case array([JSON]) // [2, 3, "ABC", null]
    case string(String)
    case number(Double) // JSON標準では`double`以外でも良い
    case boolean(Bool)
    case null
    
    init(dictionaryLiteral elements: (String, JSON)...) {
        self = .object([String: JSON](elements) { a, b in a })
    }
    init(arrayLiteral elements: JSON...) {
        self = .array(elements)
    }
    init(stringLiteral value: String) {
        self = .string(value)
    }
    init(integerLiteral value: Int) {
        self = .number(Double(value))
    }
    init(floatLiteral value: Double) {
        self = .number(value)
    }
    init(booleanLiteral value: Bool) {
        self = .boolean(value)
    }
    init(nilLiteral: ()) {
        self = .null
    }
    
    subscript(index: Int) -> JSON {
        guard case .array(let elements) = self else {
            preconditionFailure()
        }
        return elements[index]
    }
    subscript<Key: StringProtocol>(key: Key) -> JSON {
        guard case .object(let members) = self else {
            preconditionFailure()
        }
        return members[String(key)] ?? .null
    }
    subscript(dynamicMember key: String) -> JSON {
        self[key]
    }
    
    var description: String {
        switch self {
        case .object(let members): return members.description
        case .array(let elements): return elements.description
        case .string(let value): return value
        case .number(let value): return value.description
        case .boolean(let value): return value.description
        case .null: return "null"
        }
    }
}
