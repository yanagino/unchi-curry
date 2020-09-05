class ThemesController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :destroy]

  def new
    @theme = current_user.themes.build
  end

  def create
    @theme = current_user.themes.build(theme_params)
    @theme.vote1 = 0
    @theme.vote2 = 0
    @theme.sum = 0
    @theme.difference = 0
    if @theme.save
      flash[:success] = "お題を作成しました"
      redirect_to("/themes/#{@theme.id}/summary")
    else
      flash.now[:danger] = "お題の作成に失敗しました"
      render("themes/new")
    end
  end

  def destroy
    @theme = Theme.find_by(id: params[:id])
    @theme.destroy
    flash[:success] = "お題を削除しました"
    redirect_to("/users/#{current_user.uid}")
  end

  def show
    @theme = Theme.find_by(id: params[:id])
  end

  def result
    @theme = Theme.find_by(id: params[:id])

    @tweet_url = URI.encode(
    "http://twitter.com/intent/tweet?original_referer=" +
    request.url +
    "&url=" +
    "https://curry-unchi.herokuapp.com/"  + #ここに最終的なURLを入れる
    "&text=" +
    "#カレー味のうんち\n\n【究極の選択】みんなはどっち派？\n\nお題『#{@theme.title}』\n\nA. #{@theme.theme1}：#{@theme.vote1}\nB. #{@theme.theme2}：#{@theme.vote2}\n\n50対50になるような究極の質問を目指そう！\n\n" 
    )
  end

  def add
    @theme = Theme.find_by(id: params[:id])
    if @theme
      if params[:vote].to_i == 1
        @theme.vote1 += 1
        @theme.sum += 1
        @theme.difference += 1
        @theme.save
        flash[:success] = "投票しました"
        redirect_to("/themes/#{@theme.id}/summary")
      elsif params[:vote].to_i == 2
        @theme.vote2 += 1
        @theme.sum += 1
        @theme.difference -= 1
        @theme.save
        flash[:success] = "投票しました"
        redirect_to("/themes/#{@theme.id}/summary")
      else
        flash.now[:danger] = "投票できませんでした"
        render("themes/show")
      end
    else
      flash[:danger] = "投票できませんでした"
      redirect_to("/")
    end
  end

  private
  def theme_params
    params.require(:theme).permit(:title, :theme1, :theme2)
  end
end
