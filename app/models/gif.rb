class Gif < ActiveRecord::Base
  belongs_to :category
  validates :image_path, presence: true
  has_many :users, through: :favorite
  has_many :favorites, dependent: :delete_all
end
