class Roll < ApplicationRecord
  belongs_to :user
  belongs_to :training_session
  has_many :moves
end
