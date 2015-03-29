
get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do

  erb :"surveys/new"
end

post '/surveys' do
  @survey = Survey.create(params[:survey])
  @survey.add_question(params)

  erb :"surveys/show"
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
    puts params

    # @response = Response.new(params[:choice])
    # @response.save

    # current_user.responses.create(survey: @survey, choice: )
    redirect "surveys/#{@survey.id}/results"
  end

get '/surveys/:survey_id/results' do
  @survey = params[:survey_id]


  erb :"results/show"
end
