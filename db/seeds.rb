megalord = User.create(name: "megaloard", email: "megaloard@joejoe.com", password: "megalord120")
joe = User.create(name: "joe", email: "joe@joejoe.com", password: "joe120")
joanne = User.create(name: "joanne", email: "joanne@joejoe.com", password: "joanna120")

cuddle_bear_survey = Survey.create(creator: megalord, description: "Imagine a world where there are only bears. How would you survive?",title: "Cuddle Bears?")

cuddle_bear_question_one = cuddle_bear_survey.questions.create(content: "Do you cuddle with teddy bears in your darkest hour?")

cuddle_bear_question_two = cuddle_bear_survey.questions.create(content: "Do you believe in magic?")

choice_one = cuddle_bear_question_one.choices.create(content: "Yes")
choice_two = cuddle_bear_question_one.choices.create(content: "No")

choice_three = cuddle_bear_question_two.choices.create(content: "Yes")

choice_four = cuddle_bear_question_two.choices.create(content: "No")

response_one = Response.create(voter: joe, choice: choice_one, survey: cuddle_bear_survey)
response_two = Response.create(voter: joe, choice: choice_three, survey: cuddle_bear_survey)

response_one = Response.create(voter: joanne, choice: choice_two, survey: cuddle_bear_survey)
response_two = Response.create(voter: joanne, choice: choice_four, survey: cuddle_bear_survey)

new_survey = Survey.create(creator: megalord, description: "We are the Bears Shufflin' Crew Shufflin' on down, doin' it for you. We're so bad we know we're good. Blowin' your mind like we knew we would. You know we're just struttin' for fun Struttin' our stuff for everyone. We're not here to start no trouble. We're just here to do the Super Bowl Shuffle.", title: "Bears.")

