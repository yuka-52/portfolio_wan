# Wan Search

迷子犬の情報投稿サイトです。
飼い犬が迷子になった際の情報呼びかけや迷い犬を保護・目撃した際の飼い主探しに役立ちます。


*使用技術
 ・Ruby 3.0.2
　・Rails 6.1.4
　・MySQL
　・Docker/Docker-compose
　・AWS
　・Rspec 
　・Rubocop

*機能一覧
　・ユーザー登録、ログイン機能（devise）
　・投稿機能
　　-画像投稿（carrierwave）
　　-投稿を作成したユーザーのみ編集・削除可能
　・検索機能

* テスト
　・単体テスト(model)
　・機能テスト(request)
　・統合テスト(feature)←未実装
