class Cycle < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 9999, with: /\A[0-9]+\z/ }
end
