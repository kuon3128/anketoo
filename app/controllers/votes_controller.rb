class VotesController < ApplicationController
  def create
    current_user.vote(params[:vote_id])
    flash[:success] = '投票しました'
    redirect_to question_path(current_user)
  end

  def destroy
  end
  
end
