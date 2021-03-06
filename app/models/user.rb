class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#,:omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,:provider, :uid ,:image_path
  has_many :comments
  has_many :recipes
  has_many :authentications, :dependent => :delete_all

def apply_changes(omniauth)
  self.email = omniauth['info']['email']
  self.image_path = omniauth['info']['image']
end
	
def apply_omniauth(auth)
  self.apply_changes(auth)
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
end


#after_destroy :ensure_an_admin_remains
def ensure_an_admin_remains
    if User.count.zero?
      #raise ActiveRecord::Rollback
      raise "Can't delete last user'"
    end
  end


end
