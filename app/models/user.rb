class User < ApplicationRecord
  
  has_secure_password # Method from BCrypt gem.
  
  validates :first_name, :last_name, presence: true, length: { maximum: 45 },  
                  format: { with: /\A[a-zA-Z]+( [a-zA-Z])*/  }                                  
  
  EMAIL_REGEXP = /\A[^@\s]+@[a-z\d\-]+(\.[a-z])*\.[a-z]{2,3}\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEXP, 
                                              message: "is not a valid email" }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  # Method to create password digest for user fixtures
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    # Equal code
    # if ActiveModel::SecurePassword.min_cost
    #   cost = BCrypt::Engine.MIN_COST
    # else
    #   cost = BCrupt::Engie.cost
    # end
    BCrypt::Password.create(string, cost: cost)
  end
end
