class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :photos, :as => :photoable, :dependent => :destroy
  accepts_nested_attributes_for :photos
  
  scope :vote, order("voted DESC, created_at ASC")
  
  acts_as_voteable
  
  acts_as_commentable
  
  protected
    def self.new_one
      answer = self.new
      answer.photos.build
      return answer
    end
end
