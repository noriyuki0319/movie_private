class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  default_scope -> { order(id: :desc) }
  validates :talk, presence: true
end
