class AddPieceIdToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :piece_id, :integer
  end
end
