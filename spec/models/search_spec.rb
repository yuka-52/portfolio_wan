require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { FactoryBot.create(:user) }
    let!(:search) { build(:search, user_id: user.id) }
    subject { test_search.valid? }
    let(:test_search) { search }

    context 'カラムが空欄でないことのテスト' do
      it 'タイトルが空欄でないこと' do
        test_search.search_title = ''
        is_expected.to eq false;
      end

      it '犬種が空欄でないこと' do
        test_search.dog_breed = ''
        is_expected.to eq false;
      end

      it '特徴が空欄でないこと' do
        test_search.dog_profile = ''
        is_expected.to eq false;
      end

      it '年齢が空欄でないこと' do
        test_search.dog_age = ''
        is_expected.to eq false;
      end
      it '400文字以下であること' do
        search.dog_profile = Faker::Lorem.characters(number:401)
        expect(search.valid?).to eq false;
      end

      it '逃げた場所が空欄でないこと' do
        test_search.disappeared_place = ''
        is_expected.to eq false;
      end

      it '逃げた日付が空欄でないこと' do
        test_search.disappeared_date = ''
        is_expected.to eq false;
      end

      it '連絡先が空欄でないこと' do
        test_search.contact = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Protection.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
