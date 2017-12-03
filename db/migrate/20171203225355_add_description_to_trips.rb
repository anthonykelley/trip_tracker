class AddDescriptionToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :description, :text
  end
end
