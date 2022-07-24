class User < ApplicationRecord
  # Include default devise modules. Others available are:
  
  devise :database_authenticatable, :registerable, :validatable
  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories
end
