class User < ApplicationRecord
    has_secure_password
     validates :password_confirmation, presence: true
     validates :email, :uniqueness => true
     validates :email, :uniqueness =>{case_sensitive: false}
     validates :password, :length => { :minimum => 3 }
     validates :name, presence: true
     def self.authenticate_with_credentials(email, pass)
     
     user = User.where("email ILIKE ?", email.strip).first
      
       if user && user.authenticate(pass)
        return user
       else
        return nil
     end
    end
end
