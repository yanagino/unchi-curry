class HomesController < ApplicationController
  def index
    @themes_even = Theme.where("sum > ?", 9).where(difference: 0).limit(5)

    @themes_difference = Theme.where("sum > ?", 19).select("id, title, vote1, vote2, ABS(difference) AS difference_abs").where("difference_abs > sum * 0.5").order(different_abs: "DESC")

    @themes_popular = Theme.all.order(sum: "DESC").limit(5)
    
    @themes_new = Theme.all.order(created_at: "DESC").limit(5)

    @theme = Theme.where("id >= ?", rand(Theme.first.id .. Theme.last.id - 10)).first
  end

  def show
  
  end
end
