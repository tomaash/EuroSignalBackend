class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :login, :password, :password_confirmation,
                  :current_task_id, :role_id
  acts_as_authentic
  has_many :locations
  belongs_to :current_task, :class_name => 'Task', :foreign_key => "current_task_id"
  belongs_to :role

  def self.all_for_select
    User.all.map{|x| [x.login, x.id]}
  end

  def has_role?(role)
    if (self.role && self.role.code == role)
      return true
    else
      return false
    end
  end

end
