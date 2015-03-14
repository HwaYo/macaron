class ContributionsController < ApplicationController
  def new
    @fund = Fund.find(params[:fund_id])
    @contribution_form = ContributionForm.new
  end

  def create
    @fund = Fund.find(params[:fund_id])
    @contribution_form = ContributionForm.new(contribution_form_params)

    if @contribution_form.save
      redirect_to fund_path(@fund)
    else
      render "new"
    end
  end

private
  def contribution_form_params
    params.require(:contribution_form).merge({
      user_id: current_user.id,
      fund_id: params[:fund_id]
    })
  end
end
