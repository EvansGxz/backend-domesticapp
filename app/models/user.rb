class User < ApplicationRecord
  has_secure_password
  has_secure_token
  has_one :customer, dependent: :destroy
  has_one :employee, dependent: :destroy
  has_one :admin, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { scope: :user_type }
  validates :user_type, presence: true,
                        inclusion: { in: ["customer", "employee", "admin"],
                                     message: "should be employee, costumer or admin" }
  validates :password, length: { minimum: 6 }, on: :create

  def invalidate_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end

  def self.authenticate_social(email)
    user = User.find_by(email: email)

    user.regenerate_token
    user
  end

  def self.authenticate_phone(phone)
    user = User.find_by(phone: phone)
    user.regenerate_token
    user
  end
end
