class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # acts_as_target email: :email, email_allowed: :email_enabled\
  has_secure_password
end
