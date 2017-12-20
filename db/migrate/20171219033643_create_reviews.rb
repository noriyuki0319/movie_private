class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :movie_id
      t.string :nickname
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
