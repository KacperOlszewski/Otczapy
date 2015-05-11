class GalleriesController < ApplicationController
  
layout 'admin'
before_action :user_check, :admin_check

 before_action :parent_type


  def index
    @galleries = @types.galleries.sort
  end

  def new
    @galleries = Gallery.new({:name=>"Tytuł?", :type_id => @types.id, :position => (@types.galleries.count + 1)})
    @type = Type.order('position ASC')
    @counter = @types.galleries.count + 1
  end

  def create
    @galleries = Gallery.new(gallery_params)
    if @galleries.save
      flash[:notice] = "Galeria pomyślnie utworzona"
      redirect_to(:action=>'index', :type_id => @types.id)
    else
      @counter = @types.galleries.count + 1
      @type = Type.order('position ASC')
      render('new')
    end
  end


  def edit
    @type = Type.order('position ASC')
    @counter = @types.galleries.count
    @galleries = Gallery.find(params[:id])
  end

  def update
        @galleries = Gallery.find(params[:id])
          if @galleries.update_attributes(gallery_params) 
       redirect_to(:action => "index", :id => @galleries.id, :type_id => @types.id)
         flash[:notice] = 'Pomyślnie zaktualizowano!'
         else
          @counter = @types.galleries.count
          @type = Type.order('position ASC')
          render('edit')
        end
  end

  def delete
    @galleries = Gallery.find(params[:id])
  end

  def destroy
    galleries = Gallery.find(params[:id]).destroy
    flash[:notice] = 'Pomyślnie usunięto!'
    redirect_to(:action => "index", :type_id => @types.id) 
  end

  def show
    @galleries = Gallery.find(params[:id])
  end

private
def gallery_params
  params.require(:galleries).permit(:name, :position, :created_at, :type_id, :img)
end

  def parent_type
    if params[:type_id]
      @types = Type.find(params[:type_id])
    end
  end
  
end