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

  def new
    @question = Question.new
    4.times { @question.choices.build }
  end

  def create
     @question = current_user.questions.build(question_params)

    if @question.save
      flash[:success] = "アンケートを投稿しました。"
      redirect_to "/"
    else
      flash.now[:danger] = "アンケートの投稿に失敗しました。"
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to "/"
  end
  
  private
  def question_params
    params.require(:question).permit(:content, choices_attributes: :content)
  end
  
  def vote(choice)
    unless self == choice.question.user
      @vote = Vote.create(user_id: @current_user, question_id: choice.question_id, choice_id: choice)
    end
  end

end

