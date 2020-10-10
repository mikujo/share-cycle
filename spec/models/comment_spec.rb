require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context '新規投稿がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@comment).to be_valid
      end
    end

    context '新規投稿がうまくいかない時' do
      it 'textが空だと保存できないこと' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'reviewが紐付いていないと保存できないこと' do
        @comment.review = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Review must exist')
      end
    end
  end
end
