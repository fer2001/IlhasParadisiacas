class Island < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  geocoded_by :location

  validates :name, :description, :price, :location, presence: true
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model

  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
  }
end
