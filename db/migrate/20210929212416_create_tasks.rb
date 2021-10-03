class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :status, null: false, default: 0
      t.datetime :ended_at
      t.string :title, null: false

      t.timestamps
    end
  end
end
