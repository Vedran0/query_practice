class FavoriteDessert < ActiveRecord::Base

  belongs_to :user
  belongs_to :dessert

end
