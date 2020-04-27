class Piece < ApplicationRecord
    validates :title, presence:true, length: { minimum:3, maximum:100}
    validates :description, presence:true, length: { minimum:6, maximum:4000}
end 

