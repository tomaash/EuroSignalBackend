class TaskState < ActiveRecord::Base
  attr_accessible :name
  has_many :task_statuses
  has_many :tasks


  def self.all_for_select
    self.all.map{|x| [x.name, x.id]}
  end

end
