//
//  ArticleBaseView.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/10/21.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

protocol ArticleBaseViewDelegate: AnyObject {
    func didTapCell()
}
struct ArticleBaseView: View {
    class DataSource: ObservableObject {
        @Published var articles: [Item] = []
        @Published var listIndex: Int = 0
    }
    weak var delegate: ArticleBaseViewDelegate?

    @ObservedObject var dataSource: DataSource
    @State var keyword = ""

    private let textFieldPaddingSize: CGFloat = 15.0
    
    var body: some View {
        VStack {
            TextField("絞り込み検索", text: $keyword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(self.textFieldPaddingSize)
            List(dataSource.articles.indices, id: \.self) { i in
                ArticleCell(title: dataSource.articles[i].title,
                            pubDate: dataSource.articles[i].pubDate)
                    .onTapGesture {
                        print("DEBUG: List Index = \(i) がタップされました", i)
                        dataSource.listIndex = i
                        self.delegate?.didTapCell()
                    }
            }
        }
    }
}
