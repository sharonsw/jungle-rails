class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, inclusion: {in: 1...6}
  validates :content, presence: true

  attr_reader :make_rating

  def self.make_rating
    choices = []
    (1..5).each do |rate|
      choices << [ rate.to_s, rate ]
    end
    choices
  end
end
