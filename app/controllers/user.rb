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
  user = User.new(params[:user])
  if user
    session[:user_id] = user.id
    user.save
    redirect "/surveys"
  end

end

get "/logout" do
  session[:user_id] = nil
  redirect "/surveys"
end
