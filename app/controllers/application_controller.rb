class ApplicationController < ActionController::Base
  include SessionsHelper
  def require_logged_in
    unless logged_in?
      flash[:warning] = "ログインが必要です"
      redirect_to("/")
    end
  end
end
