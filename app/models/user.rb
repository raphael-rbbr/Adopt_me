class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, through: :adoption
  has_many :messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  validates :first_name, :last_name, :zip_code, :house_number, presence: true
  validates :profile, presence: true, length: { minimum: 6 }
end
