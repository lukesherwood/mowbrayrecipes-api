class UserSerializer < ActiveModel::Serializer
  attributes :name, :id, :email
  has_many :recipes
end
