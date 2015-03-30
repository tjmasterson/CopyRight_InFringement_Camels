get "/" do
  erb :index
end

get "/login" do

  erb :"users/login"
end

post "/login" do
  # @email = params[:user][:email]
  user = User.authenticate(params[:user])
  puts user
  if user
    puts session.inspect
    puts user.id
    session[:user_id] = user.id
    redirect "/surveys"
  else
    @error = "Invalid email or password."
    erb :"users/login"
  end

end

get "/signup" do
  erb :"users/signup"
end

post "/signup" do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/surveys"
  else
    @errors = "Oops! Account creation didn't work, try again!"
    erb :"users/login"
  end

end

get "/user/:user_id/surveys"do

  erb :"users/show"
end

get "/logout" do
  session[:user_id] = nil
  redirect "/surveys"
end
