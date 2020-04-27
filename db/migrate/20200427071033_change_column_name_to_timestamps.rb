class ChangeColumnNameToTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_column :pieces, :created_at, :timestamps
    change_column :pieces, :updated_at, :timestamps
  end
end
