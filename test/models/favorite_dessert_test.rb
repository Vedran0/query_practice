# == Schema Information
#
# Table name: favorite_desserts
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  dessert_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FavoriteDessertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
