//
//  CommonData.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/30.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

enum Common {
    /// APIのパス
    enum Api {
        // note記事RSSフィードのURL（著者：`かっくん`さん）
        static let noteRss: String = "https://note.com/fromkk/rss"
    }
    /// ProgressViewの状態
    enum ProgressViewStatus {
        static let isLoading: String = "loading"
        static let estimatedProgress: String = "estimated"
    }
}

/// HTTPメソッド
enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

/// ネットワークエラー
enum NetworkError: Error {
    case invalidURL         // 不正なURL
    case invalidResponse    // 不正なレスポンス
    case unknown            // 想定外エラー
    func description() -> String {
        switch self {
        case .invalidURL: return "DEBUG： 不正なURLです"
        case .invalidResponse: return "DEBUG： 不正なレスポンスです"
        case .unknown: return "DEBUG： レスポンスに失敗しました"
        }
    }
}
/// クライアントエラー
enum ClientError: Error {
    case parseFailed        // パース失敗
    case unknown            // 想定外エラー
}
