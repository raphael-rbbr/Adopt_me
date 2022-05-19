class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :adoptions
  has_many :pets_requested, through: :adoptions, source: :pet
  has_many :pets
  has_many :messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_one_attached :photo

  # validates :first_name, :last_name, :house_number, presence: true
  # validates :zip_code, presence: true, length: { is: 9 }, format: { with: /"^\d{5}-\d{3}$"/, message: "enter a valid zip code" }
  # validates :email, presence: true, format: { with: /"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+\.([a-z]+)?$"/, message: "enter a valid email" }
  validates :password, presence: true #, format: { with: /"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"/, message: "should have letters, numbers and at least one special character" }
  # validates :profile, presence: true, length: { minimum: 6 }
end
