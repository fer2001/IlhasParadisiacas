class Island < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :name, :description, :price, :location, presence: true
end
