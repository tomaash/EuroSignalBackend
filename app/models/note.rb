class Note < ActiveRecord::Base
  attr_accessible :content, :owner, :title, :user_id, :task_id
  belongs_to :task
  belongs_to :user
end
