class CreateBudgetEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_events do |t|
    
      t.string :name
      t.string :description
      t.decimal :amount
      t.date :date
      t.integer :budget_id

      t.timestamps
    end
  end
end
