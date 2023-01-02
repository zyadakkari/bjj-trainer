class Gym < ApplicationRecord
  belongs_to :address
  has_many :users
end
