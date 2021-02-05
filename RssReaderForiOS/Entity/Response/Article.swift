//
//  Articles.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/27.
//  Copyright © 2020 shusuke. All rights reserved.
//

struct Article: Codable {
    let status: String
    let feed: Feed
    let items: [Item]
}
struct Feed: Codable {
    // TODO：imageを受け取れるようにする
    let url: String
    let title: String
    let link: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case title
        case link
        case description
    }
    
}
struct Item: Codable {
    // TODO：thumbnailを受け取れるようにする
    let title: String
    let pubDate: String
    let link: String
    let author: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case pubDate
        case author
        case link
        case description
    }
    
    init(title: String, pubDate: String, link: String, author: String, description: String) {
        self.title = title
        self.pubDate = pubDate
        self.link = link
        self.author = author
        self.description = description
    }
}
