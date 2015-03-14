class FundsController < ApplicationController
  def new
    @gift = Gift.find(params[:gift_id])
    @friend = Friend.find(params[:friend_id])
    @fund_form = FundForm.new(params)

    render partial: "funds/new"
  end

  def create
    @fund_form = FundForm.new(params[:fund_form].merge(user_id: current_user.id))

    if @fund_form.save
      redirect_to fund_path(@fund_form.fund)
    else
      @gift = Gift.find(@fund_form.gift_id)
      @friend = Friend.find(@fund_form.friend_id)
      render new_fund_path
    end
  end

  def show
    @fund = Fund.find(params[:id])
  end
end
