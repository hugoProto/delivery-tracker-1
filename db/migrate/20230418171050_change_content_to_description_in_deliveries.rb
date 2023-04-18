class ChangeContentToDescriptionInDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :content, :description
  end
end
