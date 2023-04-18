class AddSupposedToArriveAtToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :supposed_to_arrive_at, :datetime
  end
end
