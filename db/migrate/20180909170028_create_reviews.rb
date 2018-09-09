class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.float :rating
      t.string :review_title
      t.text :review_description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
