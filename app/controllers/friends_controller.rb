class FriendsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @graph = Koala::Facebook::API.new(@user.token)

    @friends = @graph.get_connections("me", "friends")
  end
end
