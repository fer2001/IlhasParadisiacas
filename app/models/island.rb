class Island < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, :location, presence: true
end
