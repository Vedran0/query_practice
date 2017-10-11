# == Schema Information
#
# Table name: query_tasks
#
#  id                :integer          not null, primary key
#  name              :string
#  description       :text
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  resource          :string
#  singularize       :boolean          default(FALSE)
#  solution_template :text
#

require 'test_helper'

class QueryTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
