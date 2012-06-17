class CreateTaskStatuses < ActiveRecord::Migration
  def change
    create_table :task_statuses do |t|
      t.integer :task_state_id
      t.integer :task_id
      t.text :comment

      t.timestamps
    end
  end
end
