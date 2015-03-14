class GiftsController < ApplicationController
  def new
    @gift = Gift.find(params[:id])
  end

  def recommendation
    @friend = Friend.find(params[:friend_id])
    @user = User.find_by_id(@friend.user_id)
    sex = ['common','male', 'female']
    @gifts = Gift.where("min_age <= ? AND max_age > ?", @user.age+10, @user.age+10).where("gender = 0 OR gender = ?", sex.find_index(@user.gender)).order(:created_at).page(params[:page]).per(8)
  end
end
