class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    # Logic for admin dashboard
  end

  private

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "Unauthorized access"
      redirect_to root_path
    end
  end
end
