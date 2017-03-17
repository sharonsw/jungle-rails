module ApplicationHelper
  include SessionHelper
  def make_rating
    choices = []
    (1..5).each do |rate|
      choices << [ rate.to_s, rate ]
    end
    choices
  end
end
