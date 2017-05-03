class User < ApplicationRecord
  
  has_secure_password # Method from BCrypt gem.
  
end
