class CreateScriptorExecutions < ActiveRecord::Migration[8.0]
  def change
    create_table :scriptor_executions do |t|
      t.string :script_filename, null: false, index: true
      t.string :status, null: false
      t.text :executed_command, null: false
      t.text :error_message, null: true
      t.datetime :started_at, null: false
      t.datetime :finished_at, null: true

      t.timestamps
    end
  end
end
