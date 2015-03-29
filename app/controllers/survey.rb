
get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/:id' do
  if current_user
     @survey = Survey.find(params[:id])
     @questions = @survey.questions
     erb :"survey/display"
  else
      redirect "/login"
  end
end
