class RecipeSerializer
  include JSONAPI::Serializer
  attributes :name, :ingredients, :method, :serves, :image_url, :cook_time, :prep_time, :cuisine, :course, :user,
             :created_at, :updated_at, :description, :comments
  belongs_to :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer
end
