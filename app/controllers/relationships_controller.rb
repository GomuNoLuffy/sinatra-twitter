post "/users/:id/follow" do
  user = User.find(params[:id])
  current_user.follow!(user) if user
  redirect "users/#{user.id}"
end




  # def create
  #   user = User.find(params[:followed_id])
  #   current_user.follow(user)
  #   redirect "users/#{user.id}"
  # end

  # def destroy
  #   user = Relationship.find(params[:id]).followed
  #   current_user.unfollow(user)
  #   redirect "users/#{user.id}"
  # end
