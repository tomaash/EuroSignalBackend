class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :due_date
      t.string :owner
      t.integer :user_id
      t.integer :state_id
      t.string :client
      t.text :description

      t.timestamps
    end
  end
end
