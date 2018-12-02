class ToppagesController < ApplicationController
  def index
    if logged_in?
    @current_user = User.find_by(id: session[:user_id])
    @task = current_user.tasks.build  # form_for 用
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
end
