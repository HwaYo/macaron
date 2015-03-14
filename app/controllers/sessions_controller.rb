class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    

    @graph = Koala::Facebook::API.new(user.token)

    @info = @graph.get_connections("me", "friends", "fields"=>"name,birthday,gender")
    #@info = @graph.get_object("me",fields: ["birthday"])

    # raise @info.inspect

    redirect_to friends_index_path, :notice => "Signed in!"
    # raise request.env["omniauth.auth"].to_yaml
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
