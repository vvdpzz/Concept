class VotesController < ApplicationController
  def vote_up
    @voteable = params[:voteable].to_s.classify.constantize
		@voted = @voteable.find(params[:id])
		current_user.vote_exclusively_for @voted
		set_voted @voted
  end

  def vote_down
    @voteable = params[:voteable].to_s.classify.constantize
		@voted = @voteable.find(params[:id])
		current_user.vote_exclusively_against @voted
		set_voted @voted
  end
end
