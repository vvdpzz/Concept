class CommentsController < ApplicationController
  def new
    @someone = Question.find(params[:question_id])
    if params[:answer_id]
      @someone = Answer.find(params[:answer_id])
    end
  end

  def create
    @commentable = params[:commentable].to_s.classify.constantize
		@someone = @commentable.find(params[:id])
    @comment = @someone.comments.create(:user_id  => current_user.id, :body => params[:body].to_s)
  end
end
