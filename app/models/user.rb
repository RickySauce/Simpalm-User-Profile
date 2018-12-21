class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :first_name, presence: true, :length => { minimum: 2}
  validates :last_name, presence: true, :length => { minimum: 2}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, :length => { :in => 6..20 }
  validates_date :dob, :on_or_before => lambda { Date.current }

end
