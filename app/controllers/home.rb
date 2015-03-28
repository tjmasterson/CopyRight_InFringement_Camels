get '/' do

 redirect '/surveys'
end

#not done
post '/' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    end
end
