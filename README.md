# 趣味を写真と一緒に投稿できるアプリケーション
 
## アプリケーションの概要

***URL***
 https://tweetapp-06092269.herokuapp.com/

 
## テスト用アカウント

投稿者メールアドレス test1@test  
投稿者パスワード    akira22

閲覧者メールアドレス test2@test  
閲覧者パスワード    tarou11

 
## 利用方法（説明）
 
 購入者は、トップページから出品された商品をご覧になれます。
 購入したい商品があれば画像や商品名をクリックすることで商品の詳細ページにアクセスができます。
 詳細ページから購入画面にアクセスしていただくとクレジットカード情報と配送先などの９項目を入力することで商品の購入が可能です。  
 
 投稿者は、必ずログインが必要です。
 投稿者はログイン後にURL（https://tweetapp-06092269.herokuapp.com/tweets/new)にアクセスすると投稿が可能です。
 その際に投稿に対してのつぶやきたい内容とと投稿画像のどちらも入力することで投稿ができます。  
 
 閲覧者は、ログインしなくても投稿は見に行けますが、コメントやいいねボタンが押せる投稿ページには遷移できないようになっています。
 ログインしていない状態で詳細ページに行った場合ログイン画面に遷移されるような仕組みとなっています。
 ログイン後に(https://tweetapp-06092269.herokuapp.com/tweets)にアクセスすると投稿の一覧をご覧できます。
 また、URL(https://tweetapp-06092269.herokuapp.com/tweets/21)にアクセスすると投稿の詳細ページへ遷移できます。
 ここでは、投稿に対してのコメントや投稿を気に入った時に「いいね」ボタンが押せる機能がついています。
 
## 目指した課題解決  
 
 旅行が趣味な女性をターゲットに考えたアプリケーションです。
 自分が趣味などで訪れたところを共有できる場所があれば、同じ趣味の方と知り合えると考えた為このアプリケーションを作成しました。
 コメントがつけるられることでユーザー同士で共感し合った方と知り合える場所にすることでコミュニケーションも取れます。
 また投稿の検索機能がある為、新しい発見や次の行き先なども見つけることが可能です。
 
 
## 要件定義  
 ### SNS認証	
 ユーザーアカウント登録方法の選択肢を増やすためです。
 SNSアカウント（Googleアカウン、Facabookアカウント）を利用したログイン方法を選択肢として追加する。　　
 
### いいね機能
　閲覧者の方で気に入った投稿に対していいねを押すことができるようにする。  
 　コメントをしなくても共感した意思表示が相手に伝えられるようにする。
 
## 実装した機能について  
 ### SNS認証機能
トップページからこちらのURL（https://tweetapp-06092269.herokuapp.com/users/sign_up）にアクセスすると新規登録画面がご覧いただけます。
新規登録は、ニックネームとメールアドレスの他５項目を記述することで登録が行えます。
SNS（facebookとgoogle）のアカウントを持っている方では、新規登録時にニックネームとメールアドレスは引き継ぐことができるので登録するの項目が減るのでスムーズに登録が可能です。

また、こちらのURL（https://tweetapp-06092269.herokuapp.com/users/sign_in）にアクセスするとログイン画面がご覧いただけます。
一度新規登録が済んでいるユーザーの方であれば、SNSアカウントボタン一つ押すだけでログインが可能なためスムーズにサービスを利用することがかのです。

実装にあたって工夫した点は、SNSのアカウントをクリックすることでニックネームとメールアドレスをそのまま引き継ぐことが可能な点です。再入力が不要になっています。

現状、facebookとgoogleだけのSNSアカウントからしかできないので、今後はLineやインスタグラムからも行えるように実装をしていきたいと考えています。

googleアカウントでの新規登録時の動画のURLです。  
動画は新規登録画面にアクセスしているところから始まります。  
(https://gyazo.com/75d67700011de639729cc525970f4fe7)

googleアカウントでのログイン時の動画のURLです。 
動画はログイン画面アクセスしているところから始まります。  
(https://gyazo.com/95deb391868253217812121c3bf86bb0)

 ### いいね機能  
 投稿一覧画面からURL（https://tweetapp-06092269.herokuapp.com/tweets/21)にアクセスすることでご覧いただけます。
 ログインしているユーザーであれば、詳細ページから投稿にいいねボタンを押すことが可能です。
 
 実装にあたって工夫した点は、ボタンをクリックすることでカウントされるので何人の方から押してもらえたかを見ることが可能な点です。

現状、いいねボタンを押した投稿がマイページに保存されるわけではないのですぐに見に行けないので保存できるように実装していきます。

 いいね機能の動画です。
 (https://gyazo.com/d6f3c495c779bef2534cca07b03c5a3c)
 
## データベース設計
 
 ER図をご覧ください  
 https://gyazo.com/426717e5c3d6bef6debeac59179ae8e8
 
## ローカルでの作業方法
git clone https://git.heroku.com/tweetapp-06092269.git

### 自分用にローカルにgitリポジトリをつくる
git init
git add *
git commit -m "initial import"

### 変更のコミット
git commit -a -m "<comment>"

### 変更したファイルのコミット
git add --all <target>    


## user テーブル
| Column          | Type    |  Option      |
|-----------------|---------|--------------|
| nickname        | stiring | null: false  |
| last_name       | string  | null: false  |
| first_name      | string  | null: false  |
| last_name_kana  | string  |null: false   |
| first_name_kana | string  | null: false  |
| birthday        | date    | null: false  |
| email           | string  | null: false  |
| password        | string  | null: false  |

### Association

- has_many :tweets
- has_many :comment
- has_many :sns_credentials
- has_many :favorites

## sns_credentialモデル

| Column         | Type      |  Option           |
|----------------|-----------|-------------------|
| provider       | string    |                   |
| uid            | string    |                   | 
| user           | references| foreign_key: true |

## Association
- belongs_to :user


## tweet テーブル

| Column     | Type       | Option                          |
|------------|------------|---------------------------------|
| text       | string     |  null: false                    |
| image      | string     |  null: false                    |
| user       | references |  null: false, foreign_key: true |

### Association
- has_many   :comments
- belongs_to :user
- has_many :favorites


## comment テーブル

| Column      |  Type      | Option                         |
|-------------|------------|--------------------------------|
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| tweet       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

### Favorite テーブル
| Column      | Type       | Option                         |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| tweet       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
