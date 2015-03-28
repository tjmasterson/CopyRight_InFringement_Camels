class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices
  has_many :voters, through: :responses

  def total_voters
    self.voters.uniq.count
  end
end
