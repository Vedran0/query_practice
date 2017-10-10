class Dessert < ActiveRecord::Base
  has_many :favorite_desserts
  has_many :users, through: :favorite_desserts

end
