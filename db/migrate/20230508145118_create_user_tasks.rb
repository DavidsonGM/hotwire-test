class CreateUserTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tasks do |t|
      t.string :name

      t.timestamps
    end
  end
end
