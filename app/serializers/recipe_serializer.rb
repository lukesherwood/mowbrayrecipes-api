class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :method, :serves, :image_url, :cook_time, :prep_time, :cuisine, :course, :user
  belongs_to :user
end
