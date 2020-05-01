class DropColumnFromPieces < ActiveRecord::Migration[6.0]
  def change
    remove_column :pieces, :r_piece_id

  end
end
