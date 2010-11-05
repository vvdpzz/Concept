class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true
  belongs_to :user
  belongs_to :question
  
  acts_as_commentable
  acts_as_voteable
  
  scope :temphotos, lambda { where(["photoable_id IS NULL"]) }
  has_attached_file :item,
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "/delicious/:id_:style.:extension",
                    :dependent => :destroy,
                    :styles => {
                      :square   => "75x75#",
                      :thumb    => "100x75>",
                      :large    => "640x480>"
                    }
end
