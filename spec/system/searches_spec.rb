require 'rails_helper'

RSpec.describe "Searches", type: :system do
  describe 'searches/index' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      visit searches_index_path
      @search = Search.create(
        search_title: 'dog_search',
        disappeared_place: 'tokyo',
        disappeared_date: '2022-06-06',
      )
    end

    it "迷子犬を登録するリンクへ遷移できること" do
      click_link '迷子犬を登録する'
      expect(page).to have_content "迷子犬情報登録"
    end

    it "迷子犬情報を新規登録できること" do
      click_link '迷子犬を登録する'
      fill_in 'search[search_title]', with: "犬を探しています"
      fill_in 'search[dog_breed]', with: "芝犬"
      fill_in 'search[dog_age]', with: "1"
      fill_in 'search[dog_profile]', with: "特徴"
      fill_in 'search[disappeared_place]', with: "東京"
      fill_in 'search[disappeared_date]', with: "2022/06/06"
      fill_in 'search[contact]', with: "警察"
      attach_file "search_dog_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "迷子犬を登録しました"
    end

    it "迷子犬情報が不足していると新規登録できない" do
      click_link '迷子犬を登録する'
      fill_in 'search[search_title]', with: "犬を探しています"
      fill_in 'search[dog_breed]', with: "芝犬"
      fill_in 'search[dog_age]', with: ""
      fill_in 'search[dog_profile]', with: "特徴"
      fill_in 'search[disappeared_place]', with: "東京"
      fill_in 'search[disappeared_date]', with: "2022/06/06"
      fill_in 'search[contact]', with: "警察"
      attach_file "search_dog_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "全ての項目を入力してください"
    end
  end
end
