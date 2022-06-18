require 'rails_helper'

RSpec.describe Protection, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { FactoryBot.create(:user) }
    let!(:protection) { build(:protection, user_id: user.id) }
    subject { test_protection.valid? }
    let(:test_protection) { protection }
     
    context 'カラムが空欄でないことのテスト' do
      it 'タイトルが空欄でないこと' do
        test_protection.protection_title = ''
        is_expected.to eq false;
      end

      it '犬種が空欄でないこと' do
        test_protection.protection_breed = ''
        is_expected.to eq false;
      end

      it '特徴が空欄でないこと' do
        test_protection.protection_profile = ''
        is_expected.to eq false;
      end

      it '500文字以下であること' do
        protection.protection_profile = Faker::Lorem.characters(number:501)
        expect(protection.valid?).to eq false;
      end

      it '保護した場所が空欄でないこと' do
        test_protection.protection_place = ''
        is_expected.to eq false;
      end

      it '保護した日付が空欄でないこと' do
        test_protection.protection_date = ''
        is_expected.to eq false;
      end

      it '連絡先が空欄でないこと' do
        test_protection.protection_contact = ''
        is_expected.to eq false;
      end

      it '首輪の有無が空欄でないこと' do
        test_protection.protection_choker = ''
        is_expected.to eq false;
      end

      it '鑑札札の有無が空欄でないこと' do
        test_protection.protection_dogtag = ''
        is_expected.to eq false;
      end

      it '連絡した機関が空欄でないこと' do
        test_protection.contacted_institution = ''
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
