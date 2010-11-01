class TaggedController < ApplicationController
  def index
    @questions = Question.tagged_with(params[:tag])
  end
end
