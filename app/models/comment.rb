class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user
  
  validates_presence_of :content, :user_id, :status_id
  default_scope order('comments.created_at ASC')
  
  def deletable_by?(user)
    self.user == user || self.status.wall.moderatable_by?(user)
  end
end
