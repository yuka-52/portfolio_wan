require 'rails_helper'

RSpec.describe "Protections", type: :system do
  describe 'protections/index' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
      visit protections_index_path
      @protection = Protection.create(
        protection_title: 'protection_dog',
        protection_place: 'tokyo',
        protection_date: '2022-06-06',
      )
    end

    it "保護犬を登録するリンクへ遷移できること" do
      click_link '保護した犬を登録する'
      expect(page).to have_content "保護犬情報登録"
    end

    it "保護犬情報を新規登録できること" do
      click_link '保護した犬を登録する'
      fill_in 'protection[protection_title]', with: "犬を保護しています"
      fill_in 'protection[protection_breed]', with: "芝犬"
      fill_in 'protection[protection_profile]', with: "特徴"
      fill_in 'protection[protection_place]', with: "東京"
      fill_in 'protection[protection_date]', with: "2022/06/06"
      fill_in 'protection[protection_contact]', with: "自宅電話"
      fill_in 'protection[protection_choker]', with: "Yes"
      fill_in 'protection[protection_dogtag]', with: "No"
      fill_in 'protection[contacted_institution]', with: "警察"
      attach_file "protection_protection_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "保護犬を登録しました"
    end

    it "保護犬情報が不足していると新規登録できない" do
      click_link '保護した犬を登録する'
      fill_in 'protection[protection_title]', with: "犬を保護しています"
      fill_in 'protection[protection_breed]', with: "芝犬"
      fill_in 'protection[protection_profile]', with: "特徴"
      fill_in 'protection[protection_place]', with: "東京"
      fill_in 'protection[protection_date]', with: "2022/06/06"
      fill_in 'protection[protection_contact]', with: "警察"
      fill_in 'protection[protection_dogtag]', with: "Yes"
      fill_in 'protection[protection_choker]', with: "No"
      fill_in 'protection[contacted_institution]', with: ""
      attach_file "protection_protection_images", "spec/fixtures/test.jpg"
      click_button "登録"
      expect(page).to have_content "全ての項目を入力してください"
    end
  end
end
