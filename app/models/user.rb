class User < ApplicationRecord
    validates :email, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: {minimum: 5}

    has_many :books #dependent: :destroy
    has_and_belongs_to_many :roles, join_table: :roles_users
    
    def validate_password!(password)
        password == BCrypt::Password.new(self.password)
    end
end