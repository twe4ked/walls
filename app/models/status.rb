class Status < ActiveRecord::Base
  validates_presence_of :content
  validates_presence_of :user_id
  belongs_to :user
  has_many :comments
  
  default_scope order('statuses.created_at DESC')
end
