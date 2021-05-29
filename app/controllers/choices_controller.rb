class ChoicesController < ApplicationController

  def new
    @choice = Choice.new
  end
  
  def create
    @choice = current_user.choices.build(choice_params)
    @choice.save
    redirect_to "/"
  end

  def destroy
  end
end
