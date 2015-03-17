class HomeController < ApplicationController
  skip_before_action :require_login

  def index
    redirect_to friends_path if current_user
  end
end
