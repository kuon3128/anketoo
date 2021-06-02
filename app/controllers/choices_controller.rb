class ChoicesController < ApplicationController

  def new
    @choices = Choices.new
  end
  
  def create
    @choices = @question.choices.build(choice_params)
    @choices.save
    redirect_to "/"
  end

  def destroy
  end
end
