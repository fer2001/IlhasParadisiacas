class Review < ApplicationRecord
  belongs_to :island
  belongs_to :user

  validates :rating, presence: true
end
