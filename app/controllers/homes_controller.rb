class HomesController < ApplicationController
  def index
    @themes_even = Theme.where("sum > ?", 9).where(difference: 0).limit(5)

    @themes_difference = Theme.select("id, title, vote1, vote2, sum, abs(difference) AS unchi").where("sum > ?", 19).where("vote1 > sum * 0.7 OR vote2 > sum * 0.7").order(unchi: "DESC").limit(5)

    @themes_popular = Theme.all.order(sum: "DESC").limit(5)
    
    @themes_new = Theme.all.order(created_at: "DESC").limit(5)

    if Theme.first
      @theme = Theme.where("id >= ?", rand(Theme.first.id .. Theme.last.id)).first
    end
  end

  def show
  
  end
end
