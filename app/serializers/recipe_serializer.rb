class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ingredients, :method, :notes, :image_url
end