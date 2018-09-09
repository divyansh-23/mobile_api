class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
