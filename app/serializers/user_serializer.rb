class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :id, :email, :jti
  has_many :recipes
end
