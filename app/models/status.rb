class Status < ActiveRecord::Base
  attr_accessible :comment, :state_id, :task_id
  belongs_to :task
  belongs_to :state
end
