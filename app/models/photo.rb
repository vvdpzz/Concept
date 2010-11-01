class Photo < ActiveRecord::Base
  belongs_to :photoable, :polymorphic => true
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  scope :temphotos, lambda { where(["photoable_id = 0"]) }
  has_attached_file :item,
                    :path => ":rails_root/public/delicious/:id_:style.:extension",
                    :url => "/delicious/:id_:style.:extension",
                    :dependent => :destroy,
                    :styles => {
                      :square   => "75x75#",
                      :thumb    => "100x75>",
                      :nice     => "137x137>",
                      :small    => "240x180>",
                      :medium   => "500x375>",
                      :large    => "640x480>",
                      :extra    => "1024x768>"
                    }
end
