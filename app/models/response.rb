class Response < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :choice
  belongs_to :survey
  belongs_to :question

end


