class User < ApplicationRecord
    has_many :user_readings
    has_many :readings, through: :user_readings

    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
