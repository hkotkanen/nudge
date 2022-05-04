class Observation < ApplicationRecord
  has_many :observation_session_observations
  has_many :observation_sessions, through: :observation_session_observations

  validates :start, presence: true
  validates :end, presence: true

  VALID_VALUES = ['left', 'right']
  validates :value, inclusion: { in: VALID_VALUES }
end
