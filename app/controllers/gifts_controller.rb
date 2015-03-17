class GiftsController < ApplicationController
  def recommendation
    @friend = Friend.find(params[:friend_id])
    @user = User.find_by_id(@friend.user_id)
    @gifts = Gift.for_user(@user).page(params[:page]).per(8)
  end
end
