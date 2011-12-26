class UsersController < ApplicationController
  def new
    @title = "Sign up"
  end
  def show
    @user = User.find(params[:id])
    #params is equivalent to args in java
  end
  def edit
    
  end
end
