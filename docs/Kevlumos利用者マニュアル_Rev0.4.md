Kevlumos

利用者マニュアル

![](data:image/png;base64...)

２０２６年２月９日

第０.４版

目次

[1. 初回ログイン 5](#_Toc221549189)

[1.1 受信メールの確認 5](#_Toc221549190)

[1.2 ログイン情報の確認 5](#_Toc221549191)

[1.3 初回ログイン手順 6](#_Toc221549192)

[1.4 Sign in（サインイン） 6](#_Toc221549193)

[1.5 パスワード変更（初回のみ） 7](#_Toc221549194)

[1.6 ログイン完了（Home画面） 8](#_Toc221549195)

[1.7 表示内容の確認 8](#_Toc221549196)

[2 Home 9](#_Toc221549197)

[2.1 Home画面の概要 9](#_Toc221549198)

[2.2 表示内容 9](#_Toc221549199)

[3 Upload（KEVファイルのアップロード） 10](#_Toc221549200)

[3.1 Upload画面の表示 10](#_Toc221549201)

[3.2 ファイルアップロード手順 10](#_Toc221549202)

[3.3 Upload後の画面（一覧表示） 11](#_Toc221549203)

[4 Reports 12](#_Toc221549204)

[4.1 Reports画面の概要 12](#_Toc221549205)

[4.2 Viewの概要 12](#_Toc221549206)

[4.3 Splitter の概要 13](#_Toc221549207)

[4.4 Splitter の実行手順 13](#_Toc221549208)

[5 Kernel Event Log Visualizer 14](#_Toc221549209)

[5.1 Kernel Event Log Visualizerの概要 14](#_Toc221549210)

[5.2 Trace Info（基本情報） 14](#_Toc221549211)

[5.3 Count of KER\_CALL per 100ms 15](#_Toc221549212)

[5.4 Processing time of KER\_CALL per 100ms 16](#_Toc221549213)

[5.5 Thread Timeline 17](#_Toc221549214)

[5.6 Caller Traceback 17](#_Toc221549215)

[6 Help 18](#_Toc221549216)

[6.1 Help画面の概要 18](#_Toc221549217)

[6.2 表示内容 18](#_Toc221549218)

[7 Documents 19](#_Toc221549219)

[7.1 Documents画面の概要 19](#_Toc221549220)

[8 パスワード忘れの対応 20](#_Toc221549221)

[8.1 概要 20](#_Toc221549222)

[8.2 パスワード再設定画面の表示 20](#_Toc221549223)

[8.3 「Forget your password?」画面の表示 21](#_Toc221549224)

[8.4 Reset password（パスワード再設定） 22](#_Toc221549226)

[8.5 パスワード再設定完了 22](#_Toc221549227)

[8.6 注意事項 22](#_Toc221549228)

変更履歴

|  |  |  |  |
| --- | --- | --- | --- |
| 版 | 日付 | 変更内容 | 担当者 |
| 0.1 | 2026/02/06 | 初版作成 | 野本　了平 |
| 0.2 | 2026/02/08 | レイアウト変更 | 野本　浩一 |
| 0.3 | 2026/02/09 | 章追加　パスワード忘れ対応 | 野本　了平 |
| 0.4 | 2026/02/09 | レイアウト変更 | 野本　浩一 |
|  |  |  |  |

# 初回ログイン

* 1. 受信メールの確認

件名「kevlumosへのご招待」のメールを確認する

差出人が以下であること

no-reply@verificationemail.com

* 1. ログイン情報の確認

メール本文に記載されている以下の情報を確認する

* ユーザー名：

メールアドレス（例：hogehoge@k2i-jp.com）

* 一時パスワード：

メールに記載の半角英数および記号（例：HD\_hnfK2）

※ 一時パスワードは初回ログイン時のみ使用する

![](data:image/png;base64...)

* 1. 初回ログイン手順

招待メールに下記のURLが記載されているので、アクセスする

<https://kevlumos.k2i-jp.com>

画面右上に 「ログイン」 ボタンが表示される

![](data:image/png;base64...)

* 1. Sign in（サインイン）

画面右上の **「ログイン」** ボタンをクリックする

「Sign in」画面が表示される

以下を入力する

* **Email address**：招待メールに記載のメールアドレス
* **Password**：招待メールに記載の一時パスワード

「**Sign in**」ボタンをクリックする

![](data:image/png;base64...)

hogehoge@k2i-jp.com

* 1. パスワード変更（初回のみ）

初回サインイン後、「Change password」画面が表示される

New password に新しいパスワードを入力する

Confirm new password に同じパスワードを再入力する

パスワード条件は下記の通り

* 8文字以上
* 数字を含む
* 小文字を含む
* 大文字を含む
* 記号を含む

「Change password」ボタンをクリックする

![](data:image/png;base64...)

* 1. ログイン完了（Home画面）

KevlumosのHome画面が表示される

※30分操作が行われない場合、ログアウトの状態になる。

* 1. 表示内容の確認
* 左上に 「K2I KevLumos」 ロゴ
* 左メニュー（Home / Upload / Reports / Help / Documents）
* 右上に 「ログアウト」 ボタン

![](data:image/png;base64...)

1. Home
   1. Home画面の概要

ログイン後、最初に表示される画面

Kevlumosのトップ画面として、各機能メニューへの入口となる

* 1. 表示内容

画面左上に 「K2I KevLumos」

左側メニュー

* Home
* Upload (ログイン時、有効)
* Reports (ログイン時、有効)
* Help
* Documents

画面右上に 「ログアウト」 ボタン

※ Home画面自体に操作はなく、メニュー選択用の画面である。

![](data:image/png;base64...)

1. Upload（KEVファイルのアップロード）
   1. Upload画面の表示

左側メニューから 「Upload」 をクリックする

「Upload KEV file」画面が表示される

![](data:image/png;base64...)

* 1. ファイルアップロード手順

以下いずれかの方法でファイルを選択する

* 画面中央の領域にファイルをドラッグ＆ドロップ
* 「click to select a file +」をクリックしてファイルを選択

必要に応じて以下を入力する

* Title：ファイルのタイトル
* Description：ファイルの説明

※Title & Descriptionはクラウド版v0.0.2では反映されない

「Upload and Submit」ボタンをクリックする

※ ファイル未選択の場合、「Upload and Submit」ボタンが有効にならないため、アップロードは実行できない。

「Upload and Submit」ボタンを押すと転送が始まり、プログレスバーが表示される。

![](data:image/png;base64...)

* 1. Upload後の画面（一覧表示）

Uploadが正常に完了すると、自動的に「Reports」画面へ遷移する

Reports画面にて、アップロードしたファイルの解析・レポート情報を確認できる

1. Reports
   1. Reports画面の概要

アップロード済みファイルのレポート一覧が表示される

一覧には以下の情報が表示される

* Upload ID
* Title & Description
* Filename
* Timestamp

各行には、対象ファイルに対する操作を行うためのアイコンが表示される

左から順に

* Delete：対象のデータを削除する
* Status（success／processing）：Uploadの状態を表示する
* View：Kernel Event Log Visualizerを表示する
* Rebuild：解析を再実行する
* Splitter：データを分割しダウンロードする

※実際の表示はアイコンのみで、文字はカーソルをフォーカスしなければ表示されない

![](data:image/png;base64...)

* 1. Viewの概要

Viewアイコンをクリックすると、対象ファイルの Kernel Event Log Visualizer が表示される

Kernel Event Log Visualizerでは、アップロードしたKEVファイルのイベントログを視覚的に確認できる

* 1. Splitter の概要

Splitterアイコンをクリックすると、Kernel Event Log Splitter画面が表示される

既存のKEVファイルから指定した時間範囲のみを切り出し、新しいKEVファイルを作成する機能である

* 1. Splitter の実行手順

1. Reports画面でSplitterアイコンをクリックする
2. Kernel Event Log Splitter画面が表示される
3. 「Time in milliseconds」に切り出したい時間範囲を入力する

単位はミリ秒（ms）である

　（例5000-5100：5000ms-5100msの範囲を切り出す

5000-：5000ms以降を切り出す

-5000：開始から5000msまでを切り出す

※クラウド版v0.0.2では時間範囲の入力しなくともSubmitできる不具合がある。動作が不定のため、入力は必須である

1. 「Upload and Submit」をクリックする
2. 分割処理が完了するまで待ち、「Download」をクリックする

![](data:image/png;base64...)

1. Kernel Event Log Visualizer
   1. Kernel Event Log Visualizerの概要

KEVファイルに記録されたカーネルイベントの発生状況や処理時間を可視化する画面である

* 1. Trace Info（基本情報）

画面上部には、解析対象のトレース情報が表示される。

* Tracelogger Args：トレース取得時のコマンド引数
* CPU Cores：CPUコア数
* Machine：実行環境（マシン種別）
* Last Timestamp：最終イベントのタイムスタンプ
* System Release：OS：リリース情報
* System Version：OSバージョン情報

![](data:image/png;base64...)

* 1. Count of KER\_CALL per 100ms

100msごとの KER\_CALL 発生回数を可視化する

表示形式：Histogram／Stacked Bar Chart

![](data:image/png;base64...)

* 1. Processing time of KER\_CALL per 100ms

100msごとの KER\_CALL 処理時間を表示する

表示形式：Plot／Table

Top N：表示する上位イベント数を指定（例：Top 10）

![](data:image/png;base64...)

* 1. Thread Timeline

スレッドごとのイベント実行状況を時系列で表示する

![](data:image/png;base64...)

* 1. Caller Traceback

イベント発生元の呼び出し元情報を確認できる

1. Help
   1. Help画面の概要

左側メニューから 「Help」 をクリックする

Kevlumosのバージョン情報が表示される

* 1. 表示内容
* システム名：K2I KevLumos
* Version情報
* Environment
* Core
* Tools

![](data:image/png;base64...)

1. Documents
   1. Documents画面の概要

左側メニューから 「Documents」 をクリックする

![](data:image/png;base64...)

1. パスワード忘れの対応
   1. 概要

Kevlumosのログイン画面には、パスワードを忘れた場合のための 「Forgot your password?」 機能がある。本章では、パスワードを忘れた場合の再設定方法について説明する。

* 1. パスワード再設定画面の表示

1. Kevlumosの画面右上の 「ログイン」 ボタンをクリックする
2. 「Sign in」画面が表示される

![](data:image/png;base64...)

1. 画面下部の 「Forgot your password?」 をクリックする
2. 「Forgot your password?」画面が表示される
   1. 「Forget your password?」画面の表示

![](data:image/png;base64...)

hogehoge@k2i-jp.com

1. 「Email address」欄に、登録済みのメールアドレスを入力する
2. 「Reset my password」ボタンをクリックする
3. Reset password画面が表示されると同時に、入力したアドレスに下記の確認コードを示すメールが送信される

![](data:image/png;base64...)

メールの内容

差出人：no-reply@verificationemail.com

内容：確認コード（6桁）

※有効期限は10分間

心当たりがない場合は、メールを無視する

メールを受信しただけでは、パスワードは変更されない

* 1. Reset password（パスワード再設定）

1. メールに記載された Code を入力する
2. 新しいパスワードを入力する
3. 確認用パスワードを再入力する
4. 「Change password」をクリックする

![](data:image/png;base64...)

* 1. パスワード再設定完了

パスワードの変更が完了すると、ログイン画面に戻る

新しく設定したパスワードでKevlumosにログインできる

* 1. 注意事項

確認コードには有効期限がある

有効期限が切れた場合は、再度「Forgot your password?」からやり直す

初回ログイン前（一時パスワード未使用）の場合は、本機能は使用できない
