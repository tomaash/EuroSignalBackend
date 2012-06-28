class State < ActiveRecord::Base
  attr_accessible :code, :name

  def self.all_for_select
      self.all.map{|x| [x.name, x.id]}
  end

end
