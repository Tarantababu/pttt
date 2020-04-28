class Category < ApplicationRecord
    has_many :piece_categories
    has_many :piece, through: :piece_categories
    validates :name, presence: true, length: { minimum:3, maximum:26 }
    validates_uniqueness_of :name
end