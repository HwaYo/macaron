class GiftsController < ApplicationController
  def recommendation
    @friend = Friend.find(params[:friend_id])
    @gifts = Gift.where("min_age <= ? AND max_age > ?", @friend.age, @friend.age).where("gender = 0 OR gender = ?", @friend.gender).order(:created_at).page(params[:page]).per(8)
  end
end
