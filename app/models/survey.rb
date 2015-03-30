class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices
  has_many :voters, through: :responses


  def add_question(hash)
    question = Question.create(hash[:question].merge(survey_id: self.id))
    hash[:option].each do |con, option|
      question.choices.create({"content" => option})
    end
  end

  def total_voters
    self.voters.uniq.count
  end

  def recent_responses(user_id)
    self.responses.where(voter_id: user_id)
  end
end
