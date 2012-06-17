class TaskStatus < ActiveRecord::Base
  attr_accessible :comment, :task_state_id
  belongs_to :task
  belongs_to :task_state
end
