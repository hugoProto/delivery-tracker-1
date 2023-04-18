class AddArrivedToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :arrived, :boolean, default: false
  end
end
