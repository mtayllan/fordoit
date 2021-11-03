class ChangeDoneAtColumnTypeFromEvent < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :done_at
    add_column :events, :done_at, :datetime
  end
end
