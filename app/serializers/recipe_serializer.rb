class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :method, :serves, :image_url, :cook_time, :prep_time, :cuisine, :course, :user,
             :created_at, :updated_at
  belongs_to :user
end
