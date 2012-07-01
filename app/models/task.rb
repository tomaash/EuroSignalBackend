class Task < ActiveRecord::Base
  attr_accessible :name, :client, :description, :due_date, :owner, :start_date, :user_id, :state_id
  belongs_to :user
  belongs_to :state
  has_many :statuses
  has_many :notes
  has_many :locations

  validates :name, :presence => true

  def self.all_for_select
    self.all.map{|x| [x.name, x.id]}
  end

  def self.user_for_select(user_id)
    self.find_all_by_user_id(user_id).map{|x| [x.name, x.id]}
  end


end
