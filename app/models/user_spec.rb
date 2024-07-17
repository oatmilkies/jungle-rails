class UserSpec < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: false

  def self.authenticate_with_credentials(email, password)
    cleaned_email = email.strip.downcase
    user = User.find_by(email: cleaned_email)
    user && user.authenticate(password) ? user : nil
  end
end
