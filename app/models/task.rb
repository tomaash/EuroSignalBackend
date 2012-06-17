class Task < ActiveRecord::Base
  attr_accessible :name, :client, :description, :due_date, :owner, :start_date, :user_id, :task_state_id
  belongs_to :user
  belongs_to :task_state
  has_many :task_statuses
  has_many :task_notes
  has_many :locations

  def self.all_for_select
    self.all.map{|x| [x.name, x.id]}
  end

  def self.user_for_select(user_id)
    self.find_all_by_user_id(user_id).map{|x| [x.name, x.id]}
  end


end
