class Expense < ApplicationRecord
  
  belongs_to :budget
  
  validates :name, :description, :amount, presence: true
  validates :amount, numericality: { decimal: true, 
                            message: "seems to be wrongly formatted"}
  validates :budget_id, presence: true
  
end
