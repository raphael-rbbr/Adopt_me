class Pet < ApplicationRecord
  has_many :adoptions, dependent: :destroy
  has_many :adoptors, through: :adoptions, source: :user
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_address, against: [:address]

  validates :name, :species, :vaccinated, :age, presence: true
  validates :description, presence: true, length: { minimum: 6 }
end
