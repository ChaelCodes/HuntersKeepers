# frozen_string_literal: true

# Ratings Helper
module RatingsHelper
  def display_rating(rating)
    attributes = Rating::LIST.map do |attr|
      "#{attr.to_s.titlecase} #{format('%+d', rating.send(attr))}"
    end
    attributes.join(', ')
  end
end
