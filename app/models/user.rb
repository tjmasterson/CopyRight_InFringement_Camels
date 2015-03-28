class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: :creator_id
  has_many :responses, foreign_key: :voter_id
  has_many :choices, through: :responses
  has_many :answered_questions, through: :choices, source: :question
  has_many :completed_surveys, through: :answered_questions

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email) #finds user based off the given email
    user if user && (user.password == password) #returns user if the user was found by password AND its password is equal to the password given
  end

end
