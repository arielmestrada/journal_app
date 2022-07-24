class Task < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, 
                    length: { maximum: 255 }
    validates :description, presence: true
    belongs_to :category

    delegate :user, to: :category
end
