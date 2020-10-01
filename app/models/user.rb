class User < ApplicationRecord
  belongs_to :gender, optional: true
  belongs_to :blood_type, optional: true

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } # uniqueness => 一意性
  # has_sequre_password => password, password_confirmation, autthenticateメソッドが使える
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
