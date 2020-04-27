class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.string :source
      t.integer :page_number
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
