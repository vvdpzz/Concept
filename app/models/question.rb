class Question < ActiveRecord::Base
  belongs_to :user
  has_many :photos, :as => :photoable, :dependent => :destroy
  accepts_nested_attributes_for :photos
  
  acts_as_taggable
  acts_as_taggable_on :tags
  
  protected
    def self.new_one
      question = self.new
      question.photos.build
      return question
    end
end
