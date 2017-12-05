class Movie < ApplicationRecord
  belongs_to :user

class Movie
  # プロパティの設定
  attr_accessor :contens

  def initialize(contens)
    @contens = contens
  end
end
end

