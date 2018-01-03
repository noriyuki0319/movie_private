class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :user_id, :uniqueness => {:scope => :title}
  default_scope -> { order(id: :desc) }
end
