class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.float :acc
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end
end
