class Recipe < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :image
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true

  def get_image_url
    url_for(self.image) if self.image.attached?
  end
end
