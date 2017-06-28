get '/' do
  if logged_in? 
  	@following_id = current_user.followed.map(&:id).push(current_user.id)
  	@maintweets = Tweet.where(user_id: @following_id).order("created_at DESC")
  	@suggested_users = User.where.not(id: @following_id)
   	erb :"static/main"
  else 
	erb :"static/index" 
  end
end

get '/main' do
	erb :"static/main"
end
