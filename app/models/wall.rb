class Wall < ActiveRecord::Base
  validates_uniqueness_of :slug
  validates_presence_of :title, :slug, :description
  validates_format_of :slug, :with => /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/

  has_many :statuses
  has_many :moderators
  has_many :users, :through => :moderators
  
  def to_param
    self.slug
  end
  
  def self.find(id)
    find_by_slug id
  end
end
