post '/signup' do
  user = User.new(params[:user])
  if user.save
  	session[:user_id] = user.id
    redirect "users/#{user.id}"
  else
  	@signuperror = user.errors.full_messages.first #the error is from the validation whenever you try to save something in
  	#so u cannot use the this same error method in /login because you're not trying to save anything to the database
    erb :"static/index" 
  end
end 

post '/login' do 
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  user = User.find_by(email: params[:user][:email])  # Check if the user exists

  if user.try(:authenticate, params[:user][:password]) 
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect "/"

  else
    # If user's login doesn't work, send them back to the login form.
      @error = "Invalid email or password"
      erb :"static/index"
  end
end	

post '/logout' do #User.destroy DOESNT WORK
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session[:user_id] = nil
  redirect '/'    
end 

get '/users/:id' do
  #if current_user && current_user.id == params[:id].to_i

    id = params[:id]
    @user = User.find(id)
    erb :"users/profile" 
  #else 
  #  redirect '/' 
  #end 
end

get '/users/:id/edit' do  #load edit form
    @user = User.find(params[:id])
    erb :"users/edit"
end

patch '/users/:id' do #edit action
  @user = User.find(params[:id])
  @user.username = params[:username]
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.save
  redirect "/users/#{@user.id}"
end

get '/users/:id/checkfollowers' do
  #if current_user && current_user.id == params[:id].to_i

    id = params[:id]
    @user = User.find(id)
    erb :"users/checkfollowers" 
  #else 
  #  redirect '/' 
  #end 
end

get '/users/:id/checkfollowing' do
  #if current_user && current_user.id == params[:id].to_i

    id = params[:id]
    @user = User.find(id)
    erb :"users/checkfollowing" 
  #else 
  #  redirect '/' 
  #end 
end