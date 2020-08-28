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
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    // セルがロードされた時に一度だけ実行する（初期化など）
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // セルの選択状態を管理する
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // セルの再利用時に呼ばれる（例：キャッシュ削除に使う）
    override func prepareForReuse() {
        <#code#>
    }
}
