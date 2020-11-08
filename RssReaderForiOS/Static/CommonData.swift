//
//  CommonData.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/30.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

struct CommonData {
    /// APIのパス
    struct ApiUrl {
        // note記事（著者：かっくんさん, "https://note.mu/fromkk/rss"）
        // XML → JSONに変換する（rss2json.com）
        internal static let noteArticle: String = "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fnote.mu%2Ffromkk%2Frss"
    }
    /// ProgressViewの状態
    struct ProgressViewStatus {
        internal static let isLoading: String = "loading"
        internal static let estimatedProgress: String = "estimated"
    }
}
