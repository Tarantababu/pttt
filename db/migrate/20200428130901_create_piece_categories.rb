class CreatePieceCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :piece_categories do |t|
      t.integer :piece_id
      t.integer :category_id
    end
  end
end
