//
//  TableViewCell.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct ArticleCell: View {
    /// 記事タイトル
    var title: String
    /// 記事発行日
    var pubDate: String
    
    var body: some View {
        VStack {
            Text(self.title)
            Text(self.pubDate)
        }
    }
}
// MARK: - Live Preview
struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(
            title: "Note記事のタイトル",
            pubDate: "2020/2/4"
        )
    }
}
