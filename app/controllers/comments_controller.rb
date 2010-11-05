class CommentsController < ApplicationController
  def new
    if params[:question_id]
      @someone = Question.find params[:question_id]
    else
      @someone = Photo.find params[:photo_id]
    end
  end

  def create
    @commentable = params[:commentable].to_s.classify.constantize
		@someone = @commentable.find(params[:id])
    @comment = @someone.comments.create(:user_id  => current_user.id, :body => params[:body].to_s)
  end
end
