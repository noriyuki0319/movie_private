class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(id: :desc) }
  validates :title, presence: true
end
