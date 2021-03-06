# 長野CAKE　自然の中にある洋菓子屋
# <img src="https://user-images.githubusercontent.com/76931463/112435800-8f0d1500-8d88-11eb-8935-98145d47f87a.png" width="400">


## 説明

### 長野県にある洋菓子屋「長野CAKE」のECサイト
 ・通販のみの完全受注型生産

 ・送料は全国一律８００円

 ・支払いはクレジットカードか現金振り込みの２つから選択ができる

 ・家族や友人へのプレゼントなど、注文者の住所以外にも直接送ることが可能

## ER図

![ER図](https://user-images.githubusercontent.com/76931463/112425381-4f8afc80-8d79-11eb-8991-73e4b61d4727.jpg)

## アプリケーション詳細設計書
**会員側**

<img width="670" alt="スクリーンショット 2021-03-25 18 15 00" src="https://user-images.githubusercontent.com/76931463/112448721-09906180-8d96-11eb-9f01-13c9f0de17a5.png">
<img width="666" alt="スクリーンショット 2021-03-25 18 03 41" src="https://user-images.githubusercontent.com/76931463/112448149-72c3a500-8d95-11eb-8374-da0bd56f571b.png">

**管理者側**

<img width="760" alt="スクリーンショット 2021-03-25 21 06 59" src="https://user-images.githubusercontent.com/76931463/112470563-29cc1a80-8dae-11eb-9936-ccf5e593088b.png">

## 実装機能

- 会員側(顧客)
  - 会員登録・編集・退会
  - 商品閲覧(一覧・詳細)
  - 商品購入(カートに入れる・注文)
  - 注文履歴詳細確認
<img src="https://user-images.githubusercontent.com/76931463/112446639-c503c680-8d93-11eb-8942-a093e41cfeec.gif"  width="800">



- 管理者側
  - 商品登録・ジャンル登録
  - 会員閲覧(一覧・詳細)
  - 会員ステータス編集
  - 注文履歴(一覧・詳細)
  - 注文ステータス・製作ステータス編集
<img src=https://user-images.githubusercontent.com/76931463/112450532-d8189580-8d97-11eb-9acd-716c3ccd041a.gif  width="800">


## 開発環境
Ruby on Rails

### バージョン
- Rails 5.2.4.5
- Ruby 2.6.3
- gem
  - devise
  - refile
  - refile-mini_magick
  - kaminari
  - bootstrap
  - jquery-rails
  - font-awesome-sass
  - rubocop
  - rubocop-rails

## 開発者

### チーム名
**Team ZONe**

### メンバー
・りょうちん

・タカヒロ

・ガッテム

・イッシー
