class UserReading < ApplicationRecord
  belongs_to :reading
  belongs_to :user
  has_many :notes

  # attr_accessor :ret_user
end
