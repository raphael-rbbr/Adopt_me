class Pet < ApplicationRecord
  has_many :adoptors, class_name: "User", foreign_key: "user_id", through: :adoption
  belongs_to :user

  # validates :name, :species, :vaccinated, :status, :age, presence: true
  # validates :description, presence: true, length: { minimum: 6 }
end
