class PiecePiece < ApplicationRecord
  belongs_to :piece
  belongs_to :related_piece, :class_name => 'Piece'
end