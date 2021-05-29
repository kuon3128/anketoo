class ChoicesController < ApplicationController
  
  def show
     @choices = Question
  end
  
  def create
    @choice = Choice.new(choice_params)
    @choice.save
  end

  def destroy
  end
end
