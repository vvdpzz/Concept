class PhotosController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def create
    @photo = Photo.new(:item => params[:Filedata])
    @photo.item_content_type = MIME::Types.type_for(@photo.item_file_name).to_s
    @photo.user_id = current_user.id
    if @photo.save
      render :json => { :img_url => @photo.item.url(:thumb), :img_id => @photo.id }.to_json
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(:body => params[:photo][:body])
  end
  
  def destroy
    photo = Photo.find(params[:id])
    @img_id = photo.id
    
    photo.destroy
  end

end
