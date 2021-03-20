class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments, allow_destroy: true
end
