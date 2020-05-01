class AddRPieceIdToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :r_piece_id, :integer
  end
end
