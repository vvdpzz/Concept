class QuestionsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_self_question, :only => [:edit, :update, :destroy]
  
  autocomplete :tag, :name, :full => true
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html
      format.js  { render :json => @question.photos.find(:all,:select=>'id').map(&:id).to_json }
    end
  end
  
  def new
    @question = Question.new_one
  end

  def create
    @question = current_user.questions.build(params[:question])
    if @question.save
      current_user.photos.temphotos.each do |photo|
        photo.photoable_id = @question.id
        photo.photoable_type = 'Question'
        photo.save
      end
      redirect_to @question
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @question.update_attributes(params[:question])
      current_user.photos.temphotos.each do |photo|
        photo.photoable_id = @question.id
        photo.photoable_type = 'Question'
        photo.save
      end
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url
  end

  protected
    def find_self_question
      @question = current_user.questions.find(params[:id])
    end
end
