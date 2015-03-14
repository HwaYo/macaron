class FriendsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @graph = Koala::Facebook::API.new(@user.token)
  end
end
