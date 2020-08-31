module SessionsHelper
  def current_user
    @current_user ||= User.find_by(uid: session[:uid])
  end

  def logged_in?
    !!current_user
  end

  def correct_user_create
    if current_user
      current_user.uid == params[:uid]
    else
      return false
    end
  end

  def correct_user_destroy
    if current_user
      @theme = Theme.find_by(id: params[:id])
      current_user.id == @theme.user_id
    else
      return false
    end
  end
  
end
