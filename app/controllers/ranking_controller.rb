class RankingController < ApplicationController
  before_action :logged_in_user
  
  def have
    @rankings = Have.group(:item_id).order('count_id desc').limit(10).count(:id) 
  end

  def want
    @rankings = Want.group(:item_id).order('count_id desc').limit(10).count(:id) 
  end
  
  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to root_path
    end
  end
end
