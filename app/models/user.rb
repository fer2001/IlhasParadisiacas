class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :islands, dependent: :destroy
  has_many :orders
  has_many :reviews
  has_one_attached :photo

  validates :name, :phone, :email, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
