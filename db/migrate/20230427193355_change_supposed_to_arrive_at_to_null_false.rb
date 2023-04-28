class ChangeSupposedToArriveAtToNullFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :deliveries, :supposed_to_arrive_at, :datetime, null: false
  end
end
