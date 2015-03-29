class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices
  has_many :voters, through: :responses

# {"survey"=>{"title"=>"This is the name", "description"=>"here is the description"}, "question"=>{"content"=>"question 1 --"}, "option"=>{"content1"=>"option 1 --", "content2"=>"option 2 --", "content3"=>"option 3 --"}}

  def add_question(hash)
    question = Question.create(hash[:question].merge(survey_id: self.id))
    hash[:option].each do |con, option|
      question.choices.create({"content" => option})
    end
  end

  def total_voters
    self.voters.uniq.count
  end
end
