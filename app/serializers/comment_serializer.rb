class CommentSerializer
  include JSONAPI::Serializer
  attributes :content, :created_at, :rating, :recipe, :user, :name
  belongs_to :user
  belongs_to :recipe
end
