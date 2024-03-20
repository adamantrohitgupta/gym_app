class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:address,:phone_number,:date_of_birth
  has_many :plans
  
end
