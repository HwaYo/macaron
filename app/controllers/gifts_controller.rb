class GiftsController < ApplicationController
  def recommendation
    @friend = Friend.find(params[:friend_id])
    @user = User.find_by_id(@friend.user_id)
    sex = ['common','male', 'female']
    @gifts = Gift.where("min_age <= ? AND max_age > ?", @user.age, @user.age).where("gender = 0 OR gender = ?", sex.find_index(@user.gender)).order(:created_at).page(params[:page]).per(8)
  end
end
