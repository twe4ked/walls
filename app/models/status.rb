class Status < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :user_id
  belongs_to :user
  belongs_to :wall
  has_many :comments
  
  default_scope order('statuses.created_at DESC')
  
  def deletable_by?(user)
    self.user == user || self.wall.moderatable_by?(user)
  end
end
