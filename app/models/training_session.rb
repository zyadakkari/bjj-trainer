class TrainingSession < ApplicationRecord
  belongs_to :user
  belongs_to :gym
end
