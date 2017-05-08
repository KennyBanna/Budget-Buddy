class Budget < ApplicationRecord
  
  has_many :expenses, dependent: :destroy
  
end