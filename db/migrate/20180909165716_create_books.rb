class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.integer :chapter_index
      t.date :publication_date
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
