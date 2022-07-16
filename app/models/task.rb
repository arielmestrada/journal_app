class Task < ApplicationRecord
    validates :name, presence: true, 
                    uniqueness: true
    validates :description, presence: true, 
                    length: { maximum: 255 }
    validates :description, presence: true
    belongs_to :category
end
