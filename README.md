# Wan Search

*概要 　<br>
迷子犬の情報投稿サイトです。　<br>
飼い犬が迷子になった際の情報呼びかけや迷い犬を保護・目撃した際の飼い主探しに役立ちます。 <br>
<img width="1677" alt="スクリーンショット 2022-07-05 10 58 57" src="https://user-images.githubusercontent.com/98066974/177234722-7418f496-6b02-4859-a44f-050029584cd3.png">

*目的 　<br>
迷子犬の情報投稿サイトを活用することで、１匹でも多くの犬たちが家族の元に帰れるようにするため。<br>
迷子犬が減ることで、犬の殺処分減少に少しでも貢献するため。　<br>

＊なぜ作ったか
私自身、幼少期より犬と共に生活してきて犬を家族の一員だと考えています。<br>
小学校の頃に、愛犬が脱走して探し回ったことがありました。その頃は、まだSNSなどの呼びかけ方法や今のように迷子犬の情報を書き込めるような場所はなく、<br>
犬が行きそうな方向を手当たり探したり、手書きのポスターを作って近所に貼ったりして捜索しました。大型犬でひと目につきやすかったこともあり、幸い１週間後に保護された警察署から連絡があり<br>
自宅に帰ってくることができました。ですが、もう少し発見が遅かったり、探している家が特定されなければ２日後には保健所に送られて最悪の場合、殺処分になってしまうところでした。<br>
その経験から、自宅周辺で迷子犬を見つけた際は、飼い主が見つかるまで一時保護するなど保護活動に微力ですが協力するようになりました。<br>
今回ポートフォリオを制作するにあたり、自身の好きなことと社会に貢献したいと思うことという2つの視点から、１匹でも多くの迷子犬たちが家族の元に帰れる手助けをしたいと思い、本アプリケーションを<br>
制作致しました。<br>

*使用方法 　<br>
・サイトを使用するためにアカウント登録をし、ログインをする。ゲストログインもあります。　<br>
<img width="347" alt="スクリーンショット 2022-07-22 0 04 48" src="https://user-images.githubusercontent.com/98066974/180247692-ace969b9-49d1-4708-9f96-eb4ffac1cd34.png"><br>
・愛犬が迷子になった飼い主が、迷子の犬の情報を投稿できる。　<br>
・迷子の犬を保護した人が、保護犬の飼い主を見つけるために情報を投稿できる。　<br>
・迷子の犬を目撃した人が、目撃した犬の情報を投稿できる。　<br>
<img width="1339" alt="スクリーンショット 2022-07-22 0 06 02" src="https://user-images.githubusercontent.com/98066974/180247901-9a31aa39-e6ac-42a8-a80e-a9f93b938ad3.png"><br>
・迷子犬・保護犬・目撃された犬の情報が各々一覧で表示できる。<br>
<img width="893" alt="スクリーンショット 2022-07-22 0 06 56" src="https://user-images.githubusercontent.com/98066974/180248462-3100ee65-6c1b-4f8f-9919-92fcc9979e75.png"><br>
<img width="1664" alt="スクリーンショット 2022-07-22 0 09 01" src="https://user-images.githubusercontent.com/98066974/180248634-83c5de34-57f5-4251-bb50-3ee1d8efc385.png"><br>
・情報を投稿した人のみが、情報を編集・削除できる。　<br>
・投稿者にDMを送ることが出来る。<br>
<img width="898" alt="スクリーンショット 2022-07-22 0 10 54" src="https://user-images.githubusercontent.com/98066974/180250697-b70d5cb1-ea5d-43b8-8597-948bf9a5c221.png"><br>
・犬の情報投稿の詳細に、コメントを投稿できる。　<br>
<img width="547" alt="スクリーンショット 2022-07-22 0 18 57" src="https://user-images.githubusercontent.com/98066974/180250912-5e45c42f-fe6b-442a-8715-1b2357107669.png"><br>
・迷子犬・保護犬・目撃された犬の情報が各々一覧で表示できる。<br>
・犬の情報を、迷子・保護・目撃別にエリア/フリーワードで検索できる。<br>
・GoogleMapを使用し、捜索範囲を検索できる。<br>
<img width="635" alt="スクリーンショット 2022-07-22 0 19 51" src="https://user-images.githubusercontent.com/98066974/180251407-025b01e5-88a3-498b-a1c9-7ccbd9060f91.png"><br>

*こだわりポイント <br>
・GoogleMapを導入し、失踪場所や最終目撃地などと検索欄に入力することで、その場所を中心地とした地図を表示させました。 <br>
　犬の移動距離を個体別に予測し、半径（ｋｍ）距離を入力することで中心地から半径○km圏内を円上で囲い、捜索範囲を分かりやすく絞れるように実装しました。<ｂｒ>
 迷子犬の飼い主さんも、ボランティアで犬探しに協力される方も、捜索範囲を地図を細かく見ることが出来るようにしました。<br>
<img width="1644" alt="スクリーンショット 2022-07-22 0 24 29" src="https://user-images.githubusercontent.com/98066974/180252206-b76d7aba-787f-41e5-8bdb-7bbfdc8b0040.png"><br>

*使用技術 　<br>
 ・Ruby 3.0.2 <br>
　・Rails 6.1.4 <br>
　・MySQL <br>
　・Docker/Docker-compose <br>
　・AWS ,S3 <br>
　・Rspec <br>
　・Rubocop <br>
・GoogleMap API <br>

*機能一覧 　<br>
　・ユーザー登録、ログイン機能（devise） <br>
　・投稿機能 <br>
　　　-画像投稿（carrierwave） <br>
　　　-投稿を作成したユーザーのみ編集・削除可能 <br>
　・検索機能 <br>
　・コメント機能 <br>
　・DM機能 <br>
　・GoogleMap <br>
 
*テスト 　<br>
　・単体テスト(model) <br>
　・機能テスト(request) <br>
　・統合テスト(system) <br>

*ER図　<br>
<img width="1680" alt="スクリーンショット 2022-07-22 0 51 31" src="https://user-images.githubusercontent.com/98066974/180258674-094649a6-6f00-4b7d-8623-87d33f79d76b.png"> <br>
