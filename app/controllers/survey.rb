
get '/surveys' do
  puts session[:user_id]
  @surveys = Survey.all
  erb :"surveys/index"
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
