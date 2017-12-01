class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :days, null: false
      t.string :name, null: false
      t.string :season, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
