class CreatePiecePiece < ActiveRecord::Migration[6.0]
  def change
    create_table :piece_pieces do |t|
      t.integer :piece_id
      t.integer :related_piece_id
    end
  end
end
