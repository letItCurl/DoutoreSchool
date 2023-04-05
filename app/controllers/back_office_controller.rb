class BackOfficeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_type

  private

  def check_user_type
    unless current_user.is_coach?
      redirect_to root_path, notice: "Access Denied."
    end
  end
end
