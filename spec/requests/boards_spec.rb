require 'rails_helper'

RSpec.describe "Boards", type: :request do
  before do
    @board = FactoryBot.build(:board)
  end

  describe '#create' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(@board).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'コメントが空では投稿できない' do
        @board.board_content = ''
        @board.valid?
        expect(@board.errors.full_messages).to include("Board contentを入力してください")
      end

      it 'ユーザーが紐付いていなければコメントできない' do
        @board.user = nil
        @board.valid?
        expect(@board.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
