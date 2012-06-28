class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :state_id
      t.integer :task_id
      t.text :comment

      t.timestamps
    end
  end
end
