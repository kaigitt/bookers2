class UsersController < ApplicationController

  def index
    @users = User.all.order(id: "ASC")
  end

  def edit
    @user= User.find(params[:id])
  end



end
