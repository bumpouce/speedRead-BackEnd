class AddWordCountToReadings < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :wordCount, :integer
  end
end
