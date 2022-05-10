class Pet < ApplicationRecord
  has_many :users, through: :adoption

  # validates uniqueness: true
  validates :name, :species, :vaccinated, :status, :age, presence: true
  validates :description, presence: true, length: { minimum: 6 }
end
