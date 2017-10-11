# == Schema Information
#
# Table name: professions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profession < ActiveRecord::Base

  has_many :people

end
