class RecipeSerializer
  include JSONAPI::Serializer
  include Rails.application.routes.url_helpers

  attributes :name, :ingredients, :method, :serves, :image_url, :cook_time, :prep_time, :cuisine, :course, :user,
             :created_at, :updated_at, :description, :comments

  attribute :image do |object|
    object.get_image_url()
  end

  belongs_to :user, serializer: UserSerializer
  has_many :comments, serializer: CommentSerializer
end
