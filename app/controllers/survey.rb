
get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do

  erb :"surveys/new"
end

post '/surveys' do
  puts session.inspect
  puts params
  @survey = Survey.create(params[:survey])
  puts @survey.id
  @survey.add_question(params)

  redirect "/surveys"
end

get '/surveys/:id' do
  puts session.inspect
  puts current_user
  if current_user
     @survey = Survey.find(params[:id])
     @questions = @survey.questions
     erb :"surveys/show"
  else
      redirect "/login"
  end
end

  post '/surveys/:survey_id/complete' do
      puts current_user.id
      puts params
      current_user.responses.create()
  end
