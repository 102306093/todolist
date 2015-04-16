class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :event
      t.boolean :status, :default => false

      t.timestamps null: false
    end
  end
end
