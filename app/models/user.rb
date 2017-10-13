class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6, maximum: 20}
  VALID_EMAIL_REGEX =  /\A[\w+\-\.\_]+@[a-z\d\-\.\_]+[a-z]+\z/i
  validates :email , presence: true, length: { maximum:105 },
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
