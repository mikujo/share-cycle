class Review < ApplicationRecord
  belongs_to :cycle
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  with_options presence: true do
    validates :title
    validates :detail
    validates :rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  end

  validates :area_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ''
      Review.where(['detail LIKE(?)', "%#{search}%"])
    else
      Review.all
    end
  end
end
