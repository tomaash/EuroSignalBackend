class TaskNote < ActiveRecord::Base
  attr_accessible :content, :owner, :title, :user_id
  belongs_to :task
  belongs_to :user
end
