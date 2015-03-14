class ContributionsController < ApplicationController
  def new
    @contribution_form = ContributionForm.new
  end

  def create
    @contribution_form = ContributionForm.new(contribution_form_params)
    if @contribution_form.save
      render plain: "ok"
    else
      render 'new'
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
