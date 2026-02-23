# ワンタップ日記 (OneTapDiary)

SwiftUIで作成した1画面構成のiOS日記アプリです。

## 構成

- タイトル: 「ワンタップ日記」
- 1行TextField: 「今日のひとこと」
- 追加ボタン: 入力内容を保存してListへ追加
- List表示: `yyyy/MM/dd  内容` 形式
- 並び順: 新しい順（date降順）
- 削除: スワイプ削除 / EditButtonの削除
- 永続化: UserDefaultsにJSON保存・起動時復元
- 空入力時: 「追加」ボタン無効
- ダークモード/ライトモード: SwiftUI標準の外観対応

## ファイル構成

- `OneTapDiary/OneTapDiary.xcodeproj`
- `OneTapDiary/OneTapDiary/OneTapDiaryApp.swift`
- `OneTapDiary/OneTapDiary/ContentView.swift`
- `OneTapDiary/OneTapDiary/Entry.swift`
- `OneTapDiary/OneTapDiary/EntryStore.swift`

## ビルド手順

1. Xcodeで `OneTapDiary/OneTapDiary.xcodeproj` を開く
2. Signing & Capabilities の Team を必要に応じて設定
3. シミュレータ（例: iPhone 15）を選択して実行（⌘R）

## 動作確認ポイント

1. アプリ起動後、タイトル「ワンタップ日記」が表示される
2. TextFieldに1行入力し「追加」でListに追加される
3. Listの表示形式が `yyyy/MM/dd  内容` になっている
4. 新しく追加した項目が上に表示される（降順）
5. 空入力（スペースのみ含む）時、「追加」ボタンが無効
6. スワイプ削除ができる
7. 右上のEditButtonから複数削除操作ができる
8. アプリ再起動後も内容が復元される
