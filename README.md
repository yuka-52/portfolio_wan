# Wan Search

##*概要
迷子犬の情報投稿サイトです。　<br>
飼い犬が迷子になった際の情報呼びかけや迷い犬を保護・目撃した際の飼い主探しに役立ちます。 <br>
<img width="1677" alt="スクリーンショット 2022-07-05 10 58 57" src="https://user-images.githubusercontent.com/98066974/177234722-7418f496-6b02-4859-a44f-050029584cd3.png">

##*目的
迷子犬の情報投稿サイトを活用することで、１匹でも多くの犬たちが家族の元に帰れるようにするため。<br>
迷子犬が減ることで、犬の殺処分減少に少しでも貢献するため。　<br>

##*使用方法
・サイトを使用するためにアカウント登録をし、ログインをする。ゲストログインあり。　<br>
・愛犬が迷子になった飼い主が、迷子の犬の情報を投稿できる。　<br>
・迷子の犬を保護した人が、保護犬の飼い主を見つけるために情報を投稿できる。　<br>
・迷子の犬を目撃した人が、目撃した犬の情報を投稿できる。　<br>
・情報を投稿した人のみが、情報を編集・削除できる。　<br>
・犬の情報投稿の詳細に、コメントを投稿できる。　<br>
・犬の情報を、迷子・保護・目撃別にエリア/フリーワードで検索できる。<br>

##*使用技術
 ・Ruby 3.0.2 <br>
　・Rails 6.1.4 <br>
　・MySQL <br>
　・Docker/Docker-compose <br>
　・AWS ,S3 <br>
　・Rspec <br>
　・Rubocop <br>

##*機能一覧
　・ユーザー登録、ログイン機能（devise） <br>
　・投稿機能 <br>
　　　-画像投稿（carrierwave） <br>
　　　-投稿を作成したユーザーのみ編集・削除可能 <br>
　・検索機能 <br>
　・コメント機能 <br>

##*テスト
　・単体テスト(model) <br>
　・機能テスト(request) <br>
　・統合テスト(system) <br>
