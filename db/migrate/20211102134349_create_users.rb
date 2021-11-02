class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :auth0_id, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
