//
//  TableViewCell.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol ArticleCellDelegate: class {
    // デリゲートメソッドを書く（例：お気に入りボタンタップに使う）
}

class ArticleCell: UITableViewCell {
    
    internal weak var delegate: ArticleCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    // セルがロードされた時に一度だけ実行する（初期化など）
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
    // セルの選択状態を管理する
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // セルの再利用時に呼ばれる（例：キャッシュ削除に使う）
    override func prepareForReuse() {
        // 初期化処理等を書く
    }
}
// MARK: - Setting UI Method
extension ArticleCell {
    /// UIの初期設定
    private func initUI() {
        self.titleLabel.text = "タイトル"
        self.postDateLabel.text = "投稿日"
    }
    /// UIの設定
    /// - `Parameter article: note記事データ
    func setUI(article: Item) {
        self.titleLabel.text = article.title
        self.postDateLabel.text = article.pubDate
    }
}
