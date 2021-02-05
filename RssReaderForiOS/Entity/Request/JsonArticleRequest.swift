//
//  JsonArticleRequest.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/2/5.
//  Copyright © 2021 shusuke. All rights reserved.
//

import Foundation

struct JsonArticleRequest: RssConvertedJsonAPIRequest {
    /// NoteのRss情報
    let noteRss: String
    
    // GitHubAPIRequestが要求する連想型
    typealias Resonse = Item
    
    var method: HTTPMethod {
        .get
    }
    var path: String {
        "/api.json"
    }
    var parameters: [URLQueryItem]? {
        [ URLQueryItem(name: "rss_url", value: self.noteRss) ]
    }
    var body: Encodable? {
        nil
    }
}
