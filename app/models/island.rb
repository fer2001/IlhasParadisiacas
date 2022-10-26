class Island < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, :description, :price, :location, presence: true
end
