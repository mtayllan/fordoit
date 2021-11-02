class AddUserReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, foreign_key: true, null: false
    add_reference :events, :user, foreign_key: true, null: false
    add_reference :repeats, :user, foreign_key: true, null: false
  end
end
