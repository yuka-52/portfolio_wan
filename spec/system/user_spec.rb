require 'rails_helper'

RSpec.describe User, type: :system do
  before do
    @user = User.create(
      name: 'user',
      email: 'user@example.com',
      password: 'test1234',
    )
  end

  it '新規登録する' do
    visit root_path
    visit new_user_registration_path
    fill_in 'ユーザー名', with: 'user1'
    fill_in 'メールアドレス', with: 'user1@example.com'
    fill_in 'パスワード(8文字以上)', with: 'pass1234'
    fill_in 'パスワード(確認)', with: 'pass1234'
    click_button '新しいアカウントを作成'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  it 'ログインする' do
    visit root_path
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'user@example.com'
    fill_in 'パスワード', with: 'test1234'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'
  end
end
