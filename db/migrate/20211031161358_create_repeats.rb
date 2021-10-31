class CreateRepeats < ActiveRecord::Migration[6.1]
  def change
    create_table :repeats do |t|
      t.string :title, null: false
      t.integer :days, array: true, default: []
      t.datetime :hits, array: true, default: []

      t.timestamps
    end
  end
end
