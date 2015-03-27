megalord = User.create(name: "megaloard", email: "megaloard@joejoe.com", password: "megalord120")
joe = User.create(name: "joe", email: "joe@joejoe.com", password: "joe120")
joanne = User.create(name: "joanne", email: "joanne@joejoe.com", password: "joanna120")

cuddle_bear_survey = Survey.create(creator: megalord, title: "Cuddle Bears?")

cuddle_bear_question_one = cuddle_bear_survey.questions.create(content: "Do you cuddle with teddy bears in your darkest hour?")

cuddle_bear_question_two = cuddle_bear_survey.questions.create(content: "Do you believe in magic?")

choice_one = cuddle_bear_question_one.choices.create(content: "Yes")
choice_two = cuddle_bear_question_one.choices.create(content: "No")

choice_three = cuddle_bear_question_two.choices.create(content: "Yes")

choice_four = cuddle_bear_question_two.choices.create(content: "No")

response_one = Response.create(voter: joe, choice: choice_one)
response_two = Response.create(voter: joe, choice: choice_three)

response_one = Response.create(voter: joanne, choice: choice_two)
response_two = Response.create(voter: joanne, choice: choice_four)
