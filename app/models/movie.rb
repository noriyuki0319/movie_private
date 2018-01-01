class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  default_scope -> { order(id: :desc) }
  validates :user_id, :uniqueness => {:scope => :title}
# class Movie
#   # プロパティの設定
#   attr_accessor :contens

#   def initialize(contens)
#     @contens = contens
#   end
# end

# class Tweet

#   attr_accessor :contents

#   def initialize(contents)
#     @contents = contents
#   end
# end


end
