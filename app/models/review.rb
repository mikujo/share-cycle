class Review < ApplicationRecord
  belongs_to :cycle
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  with_options presence: true do
    validates :title
    validates :detail
    validates :rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  end

  validates :area_id, numericality: { other_than: 1 }
end
