class Order < ApplicationRecord
  belongs_to :island
  belongs_to :user
end
