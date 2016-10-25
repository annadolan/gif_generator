class Category < ActiveRecord::Base
  has_many :gifs
  validates :search_term, presence: true, uniqueness: true
end
