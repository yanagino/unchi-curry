class SessionsController < ApplicationController
  def create
    data = request.env["omniauth.auth"]

    unless data[:uid]
      flash[:danger] = "連携できませんでした"
      redirect_to("/")
    end

    @user = User.find_by(uid: data[:uid])
    if @user
      session[:uid] = @user.uid
      flash[:success] = "ログインしました"
      redirect_to("/users/#{@user.uid}")
    else
      @user = User.new(
        provider: data[:provider],
        uid: data[:uid],
        nickname: data[:info][:nickname],
        name: data[:info][:name],
        image: data[:info][:image]
      )
      if @user.save
        session[:uid] = @user.uid
        flash[:success] = "会員登録が完了しました"
        redirect_to("/users/#{@user.uid}")
      else
        flash[:danger] = "予期せぬエラーが発生しました"
        redirect_to("/")
      end
    end
  end

  def destroy
    session[:uid] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/")
  end
end
