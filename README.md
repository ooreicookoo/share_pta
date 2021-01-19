# README

# シェアワーク_負担指数シェアAPP　-for PTA -

## 概要

ターゲット：PTAに参加している保護者

今年度PTAに参加した実体験から、どうしても同じ担当係間でも個々で役割分担とその負担の隔たりを強く感じました。
活動量、またそれに費やす時間が多い人の負担を少しでも軽減するためにこの業務効率化アプリを提案します。

このアプリのメリットは、各々がPTAの中で行っている活動内容を報告（レポート）し、それにかかった時間(=負担指数）を
共有することことにより、現在のPTA活動の進捗をチームメンバー全員に共有する役目と、係の仕事の負担が大きい人の情報を可視化
（円グラフなどで表示）することによって、負担の大きい方をおもいやり、助け合えるようなアプリケーションです。

また新たな作業を割り振りたい時などに、「負担指数」を参考に依頼することも出来るので、PTA内でありがちな、なかなか
担当が決まらない、、、などの事例を回避することにも一翼を担います。
ーーーー
参照アプリ
＊BAND
https://band.us/ja

DIVE INTO POSTが参考になりそうです。

## コンセプト

誰もが使える簡単なアプリでありながら、PTA活動の中で生じてい問題と不便さを解消するアプリシリーズの第一弾。

## バージョン

Ruby 2.6.5

Ruby on Rails 5.2.4

## 機能一覧
- [ ] レポート機能
　- [ ] レポートの作成・保存
  - [ ] レポート一覧表示
  - [ ] レポートの編集・削除
- [ ] 負担指数一覧表示機能
    - [ ] 累計負担指数が高いを円グラフで表示
- [ ] ページネーション   
- [ ] ログイン機能
- [ ] マイページ機能
  - [ ] 自分の登録したレポート一覧表示
- [ ] コメント機能
  - [ ] コメントの登録・編集・削除
- [ ] チーム作成機能
- [ ] アサイン機能

■ 就業Termから2つ以上の技術「deviseとコメント機能」
■ カリキュラム外から「chartkick」

## カタログ設計
https://docs.google.com/spreadsheets/d/1N-Mj93e5uGdN14Kdls4R9bHG7HZCIrTyII6zzUkL1_U/edit#gid=0

## テーブル定義
https://docs.google.com/spreadsheets/d/1N-Mj93e5uGdN14Kdls4R9bHG7HZCIrTyII6zzUkL1_U/edit#gid=89607902

## 画面遷移図
https://docs.google.com/spreadsheets/d/1N-Mj93e5uGdN14Kdls4R9bHG7HZCIrTyII6zzUkL1_U/edit#gid=1269522839

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1N-Mj93e5uGdN14Kdls4R9bHG7HZCIrTyII6zzUkL1_U/edit#gid=235454437

## 使用予定Gem

devise

chartkick

Wicked PDF
