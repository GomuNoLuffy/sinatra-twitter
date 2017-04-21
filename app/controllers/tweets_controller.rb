post '/tweet' do
  tweet = Tweet.new(params[:tweet])
  tweet.user_id = current_user.id
  if tweet.save
    # redirect "users/#{current_user.id}/my_question"
    redirect "/"
  else
  	@error = tweet.errors.full_messages.first #the error is from the validation whenever you try to save something in
   end
end 

get '/tweets/:id' do 
	# byebug
  @tweet = Tweet.find(params[:id])
  erb :"tweets/tweet"
end


delete '/tweets/:id' do
  @tweet = Tweet.delete(params[:id])
  redirect "/"
end

get '/tweets/:id/edit' do  #load edit form
    @tweet = Tweet.find(params[:id])
    erb :"tweets/edit"
end

patch '/tweets/:id' do #edit action
  @tweet = Tweet.find(params[:id])
  @tweet.title = params[:title]
  @tweet.save
  redirect "/tweets/#{@tweet.id}"
end
