class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user_reading, null: false, foreign_key: true
      t.text :skim
      t.text :comprehension

      t.timestamps
    end
  end
end
