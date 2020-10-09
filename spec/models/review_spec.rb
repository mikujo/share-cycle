require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'レビュー投稿機能' do
    before do
      @review = FactoryBot.build(:review)
    end

    context '新規投稿がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@review).to be_valid
      end
    end

    context '新規投稿がうまくいかない時' do
      it 'titleが空だと保存できないこと' do
        @review.title = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end
      it 'detailが空だと保存できないこと' do
        @review.detail = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Detail can't be blank")
      end
      it 'area_idが1だと保存できないこと' do
        @review.area_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('Area must be other than 1')
      end
      it 'rateが空だと保存できないこと' do
        @review.rate = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('Rate is not a number')
      end
      it 'priceが1未満では保存できないこと' do
        @review.rate = 0.9
        @review.valid?
        expect(@review.errors.full_messages).to include('Rate must be greater than or equal to 1')
      end
      it 'priceが5より大きいと保存できないこと' do
        @review.rate = 5.1
        @review.valid?
        expect(@review.errors.full_messages).to include('Rate must be less than or equal to 5')
      end
      it 'userが紐付いていないと保存できないこと' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end
      it 'cycleが紐付いていないと保存できないこと' do
        @review.cycle = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Cycle must exist')
      end
    end
  end
end
