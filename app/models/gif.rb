class Gif < ActiveRecord::Base
  belongs_to :category
  validates :image_path, presence: true
end
