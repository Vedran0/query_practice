# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable, :validatable
  has_many :query_tasks
  has_many :solutions, dependent: :destroy
  has_many :comments, dependent: :destroy

  def solved_tasks
    tasks = []
    solutions.each do |solution|
      tasks << solution.query_task
    end
    QueryTask.find(tasks)
  end

end
