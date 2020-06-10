class CreateUserReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_readings do |t|
      t.references :reading, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :position
      t.integer :skimWPM
      t.integer :deepWPM
      t.integer :comprehensionRating
      t.integer :paceRating
      t.datetime :created

      t.timestamps
    end
  end
end
