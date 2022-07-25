require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '#create' do
    context 'コメント投稿できる場合' do
      it 'コメント入力済みあれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'コメントが空では投稿できない' do
        @comment.comment_content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment contentを入力してください")
      end
      it 'ユーザーが紐付いていなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
