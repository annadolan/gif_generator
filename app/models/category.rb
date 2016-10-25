class Category < ActiveRecord::Base
  has_many :gifs, dependent: :delete_all
  validates :search_term, presence: true, uniqueness: true
end
