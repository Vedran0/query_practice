# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  dob           :integer
#  profession_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base

  belongs_to :profession
  has_many :favorite_desserts
  has_many :desserts, through: :favorite_desserts

  def profession_name
    profession.name
  end

end
