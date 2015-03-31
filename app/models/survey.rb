class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices
  has_many :voters, through: :responses


  def add_question(hash)
    question = self.questions.create(hash[:question])
    hash[:option].each do |_, value|
      question.choices.create({"content" => value})
    end
  end

  def total_voters
    self.voters.uniq.count
  end

  def recent_responses(user_id)
    self.responses.where(voter_id: user_id)
  end
end
