require 'rails_helper'

RSpec.describe Sight, type: :model do
  describe 'バリデーションテスト' do
    subject { test_sight.valid? }

    let(:user) { FactoryBot.create(:user) }
    let(:test_sight) { sight }
    let!(:sight) { build(:sight, user_id: user.id) }

    context 'カラムが空欄でないことのテスト' do
      it 'タイトルが空欄でないこと' do
        test_sight.sight_title = ''
        is_expected.to eq false
      end

      it '特徴が空欄でないこと' do
        test_sight.sight_profile = ''
        is_expected.to eq false
      end

      it '500文字以下であること' do
        sight.sight_profile = Faker::Lorem.characters(number: 501)
        expect(sight.valid?).to eq false
      end

      it '目撃した場所が空欄でないこと' do
        test_sight.sight_place = ''
        is_expected.to eq false
      end

      it '目撃した日付が空欄でないこと' do
        test_sight.sight_date = ''
        is_expected.to eq false
      end

      it '連絡先が空欄でないこと' do
        test_sight.sight_contact = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Sight.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
