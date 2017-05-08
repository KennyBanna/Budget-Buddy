class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      
      t.string :name
      t.string :description
      t.decimal :amount
      t.date :date
      t.integer :budget_id
      
      t.index :date 
    end
  end
end
