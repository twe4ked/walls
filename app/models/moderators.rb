class Moderators < ActiveRecord::Base
  belongs_to :wall
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => [:wall_id]
end
