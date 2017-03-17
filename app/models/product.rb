class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  #attr_reader included (maybe)
  def sold_out?
    quantity == 0
  end
  
  #doesnt work!
  # scope :with_ratings, -> { includes(:review) }

  def self.average_rating(product_id)
    reviews = Review.where("product_id = #{product_id}")
    sum = 0
    if (reviews.length > 0)
      reviews.each do |review|
        sum += review.rating 
      end
      sum / reviews.length
    else
      sum
    end
  end
end
