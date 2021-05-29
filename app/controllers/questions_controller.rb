class QuestionsController < ApplicationController
   before_action :require_user_logged_in
  
  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @choices = @question.choices
  end

  def create
     @question = Question.new(question_params)

    if @question.save
      flash[:success] = "アンケートを投稿しました。"
      redirect_to "/"
    else
      flash.now[:danger] = "アンケートの投稿に失敗しました。"
      render "questions#new"
    end
  end

  def destroy
  end
  
  private
  def question_params
    params.require(:question).permit(:content)
  end
end
