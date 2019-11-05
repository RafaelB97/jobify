class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def employee
    @user = current_user
    @user.userType = false
    @user.save
    redirect_to root_path
  end

  def employer
    @user = current_user
    @user.userType =true
    @user.save
    redirect_to root_path
  end
end
