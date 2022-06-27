require 'rails_helper'

RSpec.describe "Tops", type: :feature do

  describe 'ログインしていない場合のトップページが表示できる' do
    before do
      visit root_path
    end

    it "homeへページ遷移できるか" do
      click_link "ホーム"
      expect(page).to have_content("ゲストログイン ログイン 新規登録")
    end
  
    it "Sign upへページ遷移できるか" do
      click_on "新規登録"
      expect(page).to have_content("新しいアカウントを作成")
    end

    it "Sign upへページ遷移できるか" do
      click_on "ログイン"
      expect(page).to have_content("ログイン")
    end

    it "ゲストログインページへ遷移できるか" do
      click_on "ゲストログイン"
      expect(page).to have_content("ゲストユーザーとしてログインしました。")
    end
  end

  describe 'ログインした場合のトップページが表示できる' do
    before do
      @user = FactoryBot.create(:user)
      visit root_path
    end

    it "迷子犬一覧へページ遷移できるか" do
      sign_in @user
      click_link "迷子の犬を探す"
      click_link "迷子犬 一覧"
      expect(page).to have_content("迷子の犬を探す")
    end

    it "保護犬一覧へページ遷移できるか" do
      sign_in @user
      click_link "迷子の犬を保護した"
      click_link "保護犬 一覧"
      expect(page).to have_content("現在保護されている犬たち")
    end

    it "目撃されている犬一覧ページへ遷移できるか" do
      sign_in @user
      click_link "迷子の犬を見かけた"
      click_link "目撃された犬 一覧"
      expect(page).to have_content("現在目撃されている犬たち")
    end

    it "迷子犬を登録するページへ遷移できるか" do
      sign_in @user
      click_link "迷子犬を登録する"
      expect(page).to have_content("迷子犬情報登録")
    end

    it "保護した犬を登録するページへ遷移できるか" do
      sign_in @user
      click_link "保護した犬を登録する"
      expect(page).to have_content("保護犬情報登録")
    end

    it "目撃した犬を登録するページへ遷移できるか" do
      sign_in @user
      click_link "目撃した犬を登録する"
      expect(page).to have_content("目撃犬情報登録")
    end
  end
end
