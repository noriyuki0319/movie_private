class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.string :director
      t.string :when
      t.text :information
      t.string :time
      t.string :category_id

      t.timestamps
    end
  end
end
