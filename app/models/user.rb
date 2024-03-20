class User < ApplicationRecord
  # has_secure_password
  # has_and_belongs_to_many :memberships
  has_many :plans
  has_many :memberships, through: :plans
  

  validates :name, presence: true
  validates :address , presence:true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
   

end
