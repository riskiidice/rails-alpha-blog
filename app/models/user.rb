class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6, maximum: 20}
  VALID_EMAIL_REGEX =  /\A[\w+\-\.\_]+@[a-z\d\-\.\_]+[a-z]+\z/i
  validates :email , presence: true, length: { maximum:105 },
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
end
