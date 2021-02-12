noteの記事をRSSで取得して表示するアプリ（SwiftUI + UIkit）
====
　
## 開発環境
- Xcode version 12.0
- pod version 1.9.1
- MacOS Catalina version 10.15.4

## 概要
### 背景と目的
- アプリ内にお知らせ機能を実装する際、noteと連携することでお知らせ投稿用の管理画面を作らずに「お知らせ」をアプリ内に表示させる
- SwiftUIを使ってViewの実装・改善工数を削減する

### 要件
- [x] あるユーザーが書いたnote記事のRSSを取得
- [x] 記事タイトル、記事投稿日をListViewに表示
- [x] ListViewのセルをタップしたら記事の本文をwebViewで表示
- [ ] ListViewではキーワードで記事を絞り込むことができる

### 設計パターン
- MVVM + SwiftUI
- ViewのみSwiftUIを使用し、それ以外はUIKitで構成（ただし、詳細画面のWebViewはUIKit）
<img width="600" src="https://user-images.githubusercontent.com/33107697/107774590-8cc79c00-6d82-11eb-8377-1ef7202e8163.png">
  
### RSS取得方法
- `https://note.com/(著者URL)/`の最後にrssをつける → `https://note.mu/(著者URL)/rss`
- RSSで取得するデータはXML形式なのでサーバーサイド（[既存API](https://rss2json.com/)）でJSON形式にエンコードしたものを取得する 

### JSON構造
- itemsは10要素分取得可能
```JSON
{
  "status": "ok",
  "feed": {
    "url": "https://note.com/***/rss",
    "title": "アカウント名",
    "link": "https://note.com/***",
    "author": "",
    "description": "アカウント説明文",
    "image": ""
  },
  "items": [
    {
      "title": "タイトル",
      "pubDate": "投稿日",
      "link": "https://note.com/***/n/n90edea869b21",
      "guid": "https://note.com/***/n/n90edea869b21",
      "author": "",
      "thumbnail": "",
      "description": " <p> 説明文 </p><br><a href="https://note.com/***/n/n90edea869b21">続きをみる</a> ",
      "content": " <p> 説明文 </p><br><a href="https://note.com/***/n/n90edea869b21">続きをみる</a> ",
      "enclosure": {
      }
      "categories": [
      ]
    },
    {

    },
  ]
}
```

## 参考文献
- 田中賢治、iOSアプリ設計パターン入門、2018年12月26日 初版第1刷発行、pp.111-126
- 金田浩明、SwiftUI徹底入門、2019年12月30日 初版第1刷発行
- [クックパッド開発者ブログ：SwiftUIを活用した「レシピ」×「買い物」の新機能開発](https://techlife.cookpad.com/entry/2021/01/18/kaimono-swift-ui)

