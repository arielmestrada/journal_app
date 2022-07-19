class Category < ApplicationRecord
    validates :name, presence: true, 
                     uniqueness: true
    has_many :tasks
    belongs_to :user
end
