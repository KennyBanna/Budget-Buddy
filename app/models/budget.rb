class Budget < ApplicationRecord
  
  validates :name, :description, :amount, presence: true
  validates :amount, numericality: { decimal: true, 
                            message: "seems to be wrongly formatted"}
    
  
end
