class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  has_many :statuses
  has_many :moderators
  has_many :walls, :through => :moderators
  
  before_validation :set_default_username
  
  validates_uniqueness_of :username
  
  # gravatars
  include Gravtastic
  gravtastic  :secure => false,
              :filetype => :png,
              :rating => 'PG',
              :default => "identicon"
              
  private
    def set_default_username
      self.username ||= self.email.split("@").first
    end
    
end
