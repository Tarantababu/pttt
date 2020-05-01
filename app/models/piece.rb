class Piece < ApplicationRecord
    belongs_to :user
    has_many :piece_categories
    has_many :piece_pieces
    has_many :related_pieces, through: :piece_pieces
    has_many :categories, through: :piece_categories
    validates :title, presence:true, length: { minimum:3, maximum:100}
    validates :description, presence:true, length: { minimum:6, maximum:4000}
end 

