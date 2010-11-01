class AnswersController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_filter :find_question
  before_filter :find_answer, :only => [:edit, :update, :destroy]
  
  def edit
  end

  def create
    current_user.photos.temphotos.each do |photo|
      answer = @question.answers.build
      answer.user_id = current_user.id
      answer.save
      photo.photoable_id = answer.id
      photo.photoable_type = 'Answer'
      photo.save
    end
    redirect_to @question
  end

  def update
    if @answer.update_attributes(params[:answer])
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @question
  end
  
  protected
    def find_question
      @question = Question.find(params[:question_id])
    end
    def find_answer
      @answer = @question.answers.find(params[:id])
    end
end
