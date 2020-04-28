class PieceCategory < ApplicationRecord
    belongs_to :piece
    belongs_to :category
end