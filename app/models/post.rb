class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  default_scope -> { order(id: :desc) }
end
