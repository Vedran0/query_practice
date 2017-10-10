# == Schema Information
#
# Table name: favorite_desserts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  dessert_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteDessert < ActiveRecord::Base

  belongs_to :user
  belongs_to :dessert

end
