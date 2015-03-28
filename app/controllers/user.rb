get "/login" do

  erb :"users/login"
end

post "/login" do
  @email = params[:user][:email]
  user = User.authenticate(@email, params[:user][:password])
  if user
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
    puts session.inspect
    user.save
    redirect "/surveys"
  end

end

get "/logout" do
  session[:user_id] = nil
  redirect "/surveys"
end
