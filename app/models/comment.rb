class Comment < ActiveRecord::Base

  validates_presence_of :text, :user_id, :query_task_id

  belongs_to :user
  belongs_to :query_task

end
