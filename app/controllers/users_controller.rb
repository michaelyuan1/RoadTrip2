class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Sign Up"
  end
  def show
    @user = User.find(params[:id])
    @title = @user.name
    #params is equivalent to args in java
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
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
