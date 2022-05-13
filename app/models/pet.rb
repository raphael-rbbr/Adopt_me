class Pet < ApplicationRecord
  has_many :adoptions, dependent: :destroy
  has_many :adoptors, through: :adoptions, source: :user
  belongs_to :user

  # validates :name, :species, :vaccinated, :status, :age, presence: true
  # validates :description, presence: true, length: { minimum: 6 }
end
