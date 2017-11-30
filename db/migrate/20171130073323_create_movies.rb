class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.string :director
      t.string :staff
      t.text :information
      t.string :time
      t.integer :category_id

      t.timestamps
    end
  end
end
