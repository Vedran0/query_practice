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

class Solution < ActiveRecord::Base

  belongs_to :query_task
  belongs_to :user

end
