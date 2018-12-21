class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, :length => { minimum: 2}
  validates :last_name, presence: true, :length => { minimum: 2}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, :length => { :in => 6..20 }
  validates_date :dob, :on_or_before => lambda { Date.current }

end
