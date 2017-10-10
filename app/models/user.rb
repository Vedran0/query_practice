# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  dob        :integer
#  profession :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  has_one :profession
  has_many :favorite_desserts
  has_many :desserts, through: :favorite_desserts

end
