class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, :uniqueness => {:scope => :movie_id}
  default_scope -> { order(id: :desc) }
  validates :nickname, presence: true
  validates :review, presence: true
  validates :rating, presence: true
end
