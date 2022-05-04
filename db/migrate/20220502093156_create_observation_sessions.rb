class CreateObservationSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :observation_sessions do |t|
      t.datetime :start
      t.datetime :end
      t.references :user, null: false, foreign_key: true
      t.references :observations, null: true, foreign_key: true

      t.timestamps
    end
  end
end
