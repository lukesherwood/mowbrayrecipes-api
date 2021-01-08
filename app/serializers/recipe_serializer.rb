class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :method, :notes, :image_url
  belongs_to :user
  set_key_transform :camel_lower
end
