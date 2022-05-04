class CreateObservationSessionObservations < ActiveRecord::Migration[7.0]
  def change
    create_table :observation_session_observations do |t|
      t.references :observation_session, null: false, foreign_key: true
      t.references :observation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
