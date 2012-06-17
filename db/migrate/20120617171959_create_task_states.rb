class CreateTaskStates < ActiveRecord::Migration
  def change
    create_table :task_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
