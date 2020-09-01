class HomesController < ApplicationController
  def index
    @themes_even = Theme.where("sum > ?", 9).where(difference: 0).limit(5)

    @themes_differences = Theme.select("id, title, vote1, vote2, sum, abs(difference) AS unchi")
    @themes_difference = @themes_differences.where("sum > ?", 9).where("unchi > (sum * 0.5)").order(unchi: "DESC").limit(5)

    @themes_popular = Theme.all.order(sum: "DESC").limit(5)
    
    @themes_new = Theme.all.order(created_at: "DESC").limit(5)

    if Theme.first
      @theme = Theme.where("id >= ?", rand(Theme.first.id .. Theme.last.id)).first
    end
  end

  def show
  
  end
end
