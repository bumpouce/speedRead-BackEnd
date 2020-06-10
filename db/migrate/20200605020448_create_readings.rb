class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.string :category
      t.string :level
      t.string :author
      t.string :title
      t.text :completeText, limit: 700000
      t.string :source
      t.string :contributor

      t.timestamps
    end
  end
end
