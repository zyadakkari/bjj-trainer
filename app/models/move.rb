class Move < ApplicationRecord
  belongs_to :user
  belongs_to :training_session
  belongs_to :roll
end
