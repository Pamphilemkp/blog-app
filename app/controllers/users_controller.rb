class UsersController < ApplicationController
  def index
    @users = User.all
    @users.each do |user|
      @user = user
    end
  end

  def show; end
end
