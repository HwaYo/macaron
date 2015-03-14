class FriendsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @graph = Koala::Facebook::API.new(@user.token)

    @friends = @graph.get_connections("me", "friends")
  end

  def new
    @user = User.find(session[:user_id])
    @friend = @user.friends.new({uid: params[:uid], name: params[:name]})

    if @friend.save
      redirect_to recommendation_gifts_path(friend_id: @friend.uid)
    else
      redirect_to recommendation_gifts_path(friend_id: Friend.find_by_uid(params[:uid]))
    end
  end

end
