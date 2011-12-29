class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Sign Up"
  end
  def show
    @user = User.find(params[:id])
    #params is equivalent to args in java
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end
  def edit
    
  end
end
