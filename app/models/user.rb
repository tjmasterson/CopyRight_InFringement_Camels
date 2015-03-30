class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: :creator_id
  has_many :responses, foreign_key: :voter_id
  has_many :choices, through: :responses
  has_many :answered_questions, through: :choices, source: :question
  has_many :completed_surveys, through: :answered_questions, source: :survey
  # validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  # validates :entered_password, :length => { :minimum => 6 }
  # validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def self.create(params)
    user = User.new(:email => params[:email])
    user.password = params[:password]
    user.save
    user
  end

  def self.authenticate(params)
    user = User.find_by_email(params[:email]) #finds user based off the given email
    (user && user.password == params[:password]) ? user : nil #returns user if the user was found by password AND its password is equal to the password given
  end

  def view_surveys(user_id)
    self.surveys.where(creator_id: user_id)
  end

  def created_surveys(user_id)
    self.view_surveys(user_id).empty?
  end


end
