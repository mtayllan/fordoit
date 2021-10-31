class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :datetime, null: false
      t.boolean :done_at

      t.timestamps
    end
  end
end
