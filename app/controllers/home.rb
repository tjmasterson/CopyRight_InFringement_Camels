get '/' do

 redirect '/surveys'
end

get '/leon' do
  puts params
  erb :"leon"
end




