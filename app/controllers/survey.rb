get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :"survey/display"
end
