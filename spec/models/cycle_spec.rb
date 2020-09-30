require 'rails_helper'

RSpec.describe Cycle, type: :model do
  describe 'サービス登録機能' do
    before do
      @cycle = FactoryBot.build(:cycle)
    end

    context '新規登録がうまくいく時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@cycle).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'imageが空だと保存できないこと' do
        @cycle.image = nil
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと保存できないこと' do
        @cycle.name = nil
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空だと保存できないこと' do
        @cycle.detail = nil
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include("Detail can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @cycle.price = ''
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが全角数字では保存できないこと' do
        @cycle.price = '３００'
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが50円未満では保存できないこと' do
        @cycle.price = '49'
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include('Price must be greater than or equal to 50')
      end
      it 'priceが10000円以上では保存できないこと' do
        @cycle.price = '10000'
        @cycle.valid?
        expect(@cycle.errors.full_messages).to include('Price must be less than or equal to 9999')
      end
    end
  end
end
