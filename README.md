noteの記事をRSSで取得して表示するアプリ
====
※　プログラム作成中 2020.9.6　※
　
## 開発環境
- Xcode version 11.6
- pod version 1.9.1
- MacOS Catalina version 10.15.4

## 概要
### 背景と目的
- アプリ内にお知らせ機能を実装する際、  
noteと連携することでお知らせ投稿用の管理画面を作らずに「お知らせ」をアプリ内に表示させることが狙い

### 要件
- あるユーザーが書いたnote記事のRSSを取得
- アカウント名、記事タイトル、記事投稿日、サムネイルをtableViewに表示
- tableViewのセルをタップしたら記事の本文をwebViewで表示
- tableViewではキーワードで記事を絞り込むことができる

### 設計パターン
- MVVM  
<img width="400" src="https://user-images.githubusercontent.com/33107697/91534737-02fb5200-e94d-11ea-9907-c55bdf835148.png">
  
### RSS取得方法
- `https://note.com/(著者URL)/`の最後にrssをつける → `https://note.mu/(著者URL)/rss`
- RSSで取得したデータはXML形式なのでクライアントサイドでJSON形式にエンコードする 

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

