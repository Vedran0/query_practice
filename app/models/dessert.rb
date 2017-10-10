# == Schema Information
#
# Table name: desserts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dessert < ActiveRecord::Base

  has_many :favorite_desserts
  has_many :users, through: :favorite_desserts

end
