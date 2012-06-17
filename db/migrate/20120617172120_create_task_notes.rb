class CreateTaskNotes < ActiveRecord::Migration
  def change
    create_table :task_notes do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :owner
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
