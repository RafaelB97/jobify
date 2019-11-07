class PagesController < ApplicationController
  def index
  end

  def employee
    @user = current_user
    @user.userType = false
    @user.save
    redirect_to jobs_path
  end

  def employer
    @user = current_user
    @user.userType =true
    @user.save
    redirect_to jobs_path
  end
end
