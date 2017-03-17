class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, inclusion: {in: 1...6}
  validates :content, presence: true


  # def self.for_products
end
