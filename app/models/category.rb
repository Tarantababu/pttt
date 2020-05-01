class Category < ApplicationRecord
    belongs_to :user
    has_many :piece_categories
    has_many :pieces, through: :piece_categories
    validates :name, presence: true, length: { minimum:3, maximum:26 }
    validates_uniqueness_of :name
end