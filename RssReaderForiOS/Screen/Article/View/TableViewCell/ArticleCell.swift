//
//  TableViewCell.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

struct ArticleCell: View {
    var title: String
    var pubDate: String
    private let lineLimitNumber: Int = 5
    private let paddingSize: CGFloat = 2.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .lineLimit(self.lineLimitNumber)
                .font(.headline)
                .padding(self.paddingSize)
            Text(self.pubDate)
                .font(.subheadline)
                .padding(self.paddingSize)
        }
        .padding(self.paddingSize)
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
