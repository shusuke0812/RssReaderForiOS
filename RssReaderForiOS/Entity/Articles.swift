//
//  Articles.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/27.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

struct Articles: Codable {
    internal let status: String
    internal let feed: Feed
    internal let items: [Item]
}
struct Feed: Codable {
    // TODO：imageを受け取れるようにする
    internal let url: String
    internal let title: String
    internal let link: String
    internal let description: String
}
struct Item: Codable {
    // TODO：thumbnailを受け取れるようにする
    internal let title: String
    internal let link: String
    internal let author: String
    internal let description: String
}
