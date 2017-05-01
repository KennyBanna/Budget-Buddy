class Budget < ApplicationRecord
  
  validates_each :name, :description, presence: true
  validates :amount, format: { with: /\A[\d+].[\d+]/}
  
end
