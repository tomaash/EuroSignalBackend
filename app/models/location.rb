class Location < ActiveRecord::Base
  attr_accessible :acc, :lat, :lng, :time, :user_id
  belongs_to :user
  belongs_to :task
end
