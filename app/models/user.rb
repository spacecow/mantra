class User
  include Mongoid::Document
  references_many :authentications
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
#  attr_accessible :email, :password, :password_confirmation
end
