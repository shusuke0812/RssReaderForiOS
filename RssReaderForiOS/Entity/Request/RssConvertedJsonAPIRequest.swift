//
//  NoteAPIRequest.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/2/5.
//  Copyright © 2021 shusuke. All rights reserved.
//

// rss2json API ドキュメント ： https://rss2json.com/docs

import Foundation

protocol RssConvertedJsonAPIRequest {
    associatedtype Resonse: Decodable
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var body: Encodable? { get }
}
// MARK: - Custom Setting
extension RssConvertedJsonAPIRequest {
    /// APIプレフィックス
    var baseURL: String {
        "https://api.rss2json.com/v1"
    }
    /// APIコール用のリクエスト生成
    func buildURLRequest() -> URLRequest {
        
        let url = URL(string: self.baseURL.appending(self.path))!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        switch self.method {
        case .get:
            components?.queryItems = self.parameters
        default:
            fatalError("Unsupported method \(self.method)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = self.method.rawValue
        
        return urlRequest
    }
}
