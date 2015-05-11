class PhotosController < ApplicationController
  
layout 'admin'
before_action :user_check, :admin_check
before_action :parent


  def index
    @photos = @gallery.photos.order('position DESC')
  end

  def new
    @photos = Photo.new({:name => @gallery.name, :gallery_id => @gallery.id, :position => (@gallery.photos.count + 1)})
    @gall = Gallery.order('position ASC')
    @counter = @gallery.photos.count + 1
  end

  def create
    @photos = Photo.new(photo_params)
    if @photos.save
      flash[:notice] = "Zdjęcie pomyślnie dodane"
      redirect_to(:action=>'index', :gallery_id => @gallery.id)
    else
      @counter = @gallery.photos.count + 1
      @gall = Gallery.order('position ASC')
      render('new')
    end
  end


  def edit
    @gall = Gallery.order('position ASC')
    @counter = @gallery.photos.count
    @photos = Photo.find(params[:id]) #parametr przekazany przez URL (przeglądarkę) -> w index, w guzikach jest wysyłany parametr
  end

  def update
        @photos = Photo.find(params[:id])
          if @photos.update_attributes(photo_params) 
       redirect_to(:action => "show", :id => @photos.id, :gallery_id => @gallery.id)
         flash[:notice] = 'Pomyślnie zaktualizowano!'
         else
          @counter = @gallery.photos.count
          @gall = Gallery.order('position ASC')
          render('edit')
        end
  end

  def delete
    @photos = Photo.find(params[:id])
  end

  def destroy
    photos = Photo.find(params[:id]).destroy
    flash[:notice] = 'Pomyślnie usunięto!'
    redirect_to(:action => "index", :gallery_id => @gallery.id) 
  end

  def show
    @photos = Photo.find(params[:id])
  end

private
def photo_params
  params.require(:photos).permit(:name, :position, :created_at, :gallery_id, :img)
end

  def parent
    if params[:gallery_id]
      @gallery = Gallery.find(params[:gallery_id])
    end
  end
  
end