require 'rails_helper'

RSpec.describe "Sights", type: :system do
  describe 'sights/index' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      visit sights_index_path
      @sight = Sight.create(
        sight_title: 'sight_dog',
        sight_place: 'tokyo',
        sight_date: '2022-06-06',
      )
    end

    it "目撃犬を登録するリンクへ遷移できること" do
      click_link '目撃した犬を登録する'
      expect(page).to have_content "目撃犬情報登録"
    end

    it "目撃犬情報を新規登録できること" do
      click_link '目撃した犬を登録する'
      fill_in 'sight[sight_title]', with: "犬を見かけました"
      fill_in 'sight[sight_profile]', with: "特徴"
      fill_in 'sight[sight_place]', with: "東京"
      fill_in 'sight[sight_date]', with: "2022/06/06"
      fill_in 'sight[sight_contact]', with: "警察"
      attach_file "sight_sight_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "目撃した犬を登録しました"
    end

    it "目撃犬情報が不足していると新規登録できない" do
      click_link '目撃した犬を登録する'
      fill_in 'sight[sight_title]', with: "犬を見かけました"
      fill_in 'sight[sight_profile]', with: "特徴"
      fill_in 'sight[sight_place]', with: "東京"
      fill_in 'sight[sight_date]', with: "2022/06/06"
      fill_in 'sight[sight_contact]', with: ""
      attach_file "sight_sight_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "全ての項目を入力してください"
    end
  end
end
