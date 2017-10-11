# == Schema Information
#
# Table name: solutions
#
#  id            :integer          not null, primary key
#  code          :text
#  user_id       :integer
#  query_task_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
