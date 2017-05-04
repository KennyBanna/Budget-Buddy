class User < ApplicationRecord
  
  has_secure_password # Method from BCrypt gem.
  
  validates :first_name, :last_name, :email, presence: true
  
  validates :first_name, :last_name,  
                  format: { with: /\A[a-zA-Z]+( [a-zA-Z])*/  }                                  
  
  REGEXP = /\A[^@]+@[a-z\d\-]+(\.[a-z])*\.[a-z]{2,3}\i/
  validates :email, format: REGEXP
end
