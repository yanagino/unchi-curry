class UsersController < ApplicationController
  def show
    @user = User.find_by(uid: params[:uid])
    @themes = @user.themes.order(created_at: "DESC").page(params[:page]).per(10)
  end
end
