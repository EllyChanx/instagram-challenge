class UsersController < ApplicationController

  def index
    @users = User.all
    @posts = User.all
  end
  
end
