# == Schema Information
#
# Table name: people
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  profession_id :integer
#  dob           :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Person < ActiveRecord::Base

  validates_presence_of :name, :email, :dob, :profession_id

  belongs_to :profession
  has_many :favorite_desserts
  has_many :desserts, through: :favorite_desserts

  def profession_name
    profession.name
  end

end
