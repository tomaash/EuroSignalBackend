class Role < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :users

  def self.all_for_select
      self.all.map{|x| [x.name, x.id]}
  end

end
