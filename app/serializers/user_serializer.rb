class UserSerializer < ActiveModel::Serializer
  attributes :name, :id, :email, :recipes
  has_many :recipes
end
