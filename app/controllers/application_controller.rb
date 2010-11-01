class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_voted(someone)
    someone.voted = someone.plusminus
    someone.save
  end
  
end
