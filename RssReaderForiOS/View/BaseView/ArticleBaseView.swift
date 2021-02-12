//
//  ArticleBaseView.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/10/21.
//  Copyright © 2020 shusuke. All rights reserved.
//

import SwiftUI

protocol ArticleBaseViewDelegate: AnyObject {
    /// セルをタップした時の処理
    func didTapCell()
}
struct ArticleBaseView: View {
    /// ViewModelの値を監視するObserver
    class DataSource: ObservableObject {
        @Published var articles: [Item] = []
    }
    /// デリゲート
    weak var delegate: ArticleBaseViewDelegate?
    /// ViewModelの値を検知して更新する
    @ObservedObject var dataSource: DataSource
    /// テキストフィールドの値
    @State var keyword = ""
    /// テキストフィールド余白
    private let textFieldPaddingSize: CGFloat = 15.0
    
    var body: some View {
        VStack {
            TextField("絞り込み検索", text: $keyword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(self.textFieldPaddingSize)
            List(dataSource.articles.indices, id: \.self) { i in
                ArticleCell(title: dataSource.articles[i].title,
                            pubDate: dataSource.articles[i].pubDate)
            }
        }
    }
}
