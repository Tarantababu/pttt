class RenameColumnForPieces < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :pieces, :piece_id, :related_piece_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
