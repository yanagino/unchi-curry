class HomesController < ApplicationController
  def index
    @themes_even = Theme.where("sum > ?", 9).where(difference: 0).limit(5)

    @themes_difference = Theme.select("id, title, vote1, vote2, sum, ABS(difference) AS difference_abs").where("difference_abs > (sum * 0.5)").where("sum > ?", 9).order(difference_abs: "DESC").limit(5)

    @themes_popular = Theme.all.order(sum: "DESC").limit(5)
    
    @themes_new = Theme.all.order(created_at: "DESC").limit(5)

    if Theme.first
      @theme = Theme.where("id >= ?", rand(Theme.first.id .. Theme.last.id)).first
    end
  end

  def show
  
  end
end
