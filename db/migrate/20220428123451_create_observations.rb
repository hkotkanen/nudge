class CreateObservations < ActiveRecord::Migration[7.0]
  def change
    create_table :observations do |t|
      t.datetime :start
      t.datetime :end
      t.string :value

      t.timestamps
    end
  end
end
