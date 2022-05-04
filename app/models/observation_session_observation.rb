class ObservationSessionObservation < ApplicationRecord
  belongs_to :observation_session
  belongs_to :observation
end
