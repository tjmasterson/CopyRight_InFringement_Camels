
get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do

  erb :"surveys/new"
end

post '/surveys' do
<<<<<<< HEAD
  puts session.inspect
  puts params
  @survey = Survey.create(params[:survey])
  puts @survey.id
  @survey.add_question(params)

  redirect "/surveys"
=======
  @survey = Survey.create(params[:survey].merge(user: current_user))
  @survey.add_question(params)

  redirect "/surveys/#{@survey.id}"
>>>>>>> origin/complete_survey
end

get '/surveys/:id' do
  puts session.inspect
  puts current_user
  if current_user
    puts session.inspect
    puts current_user
     @survey = Survey.find(params[:id])
     @questions = @survey.questions
     erb :"surveys/show"
  else
      redirect "/login"
  end
end

  post '/surveys/:survey_id/complete' do
    @survey = Survey.find_by(id: params[:survey_id])
    params[:question].each do |question_id, response|
      question = Question.find_by(id: question_id.to_i)
      question.choices.each do |choice|
        if choice.content == response
           Response.create(choice: choice, voter: current_user)
        end
      end
    end
    redirect "surveys/#{@survey.id}/results"
  end

get '/surveys/:survey_id/results' do
  @voters = User.all
  @survey = Survey.find_by(id: params[:survey_id])
  @user = current_user


  erb :"results/show"
end
