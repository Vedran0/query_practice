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

class QueryTask < ActiveRecord::Base

  validates_presence_of :name, :description

  belongs_to :user
  has_many :solutions, dependent: :destroy
  has_many :comments, dependent: :destroy

  def solved_by(user)
    solutions.map(&:user_id).include?(user.id) ? true : false
  end

end
