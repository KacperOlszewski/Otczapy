class WorkshopsController < ApplicationController
  
layout 'admin'
before_action :user_check, :admin_check

before_action :parent_cat

  def index
  	@workshops = @asd
  end

  def new
  	@workshops = Workshop.new({:name => "Nazwa Warsztatu...", :category_id => @cats.id, :position =>( @asd.count + 1)})
    @counter = @asd.count + 1
    @cat = Cat.order('position ASC')
    @gallery = Gallery.order('position ASC')
  end

  def create
  	@workshops = Workshop.new(workshop_params)
  	if @workshops.save
  		flash[:notice] = "Workshop dodany"
  		redirect_to(:action => 'index', :category_id => @cats.id)
  	else
  	 @counter = @asd.count + 1
     @cat = Cat.order('position ASC')
     @gallery = Gallery.order('position ASC')
  	 render('new')
  	end
  end

  def edit
    @workshops = Workshop.find(params[:id])
    @cat = Cat.order('position ASC')
    @gallery = Gallery.order('position ASC')
    @counter = @asd.count
  end

    def update
      @workshops = Workshop.find(params[:id])
    if @workshops.update_attributes(workshop_params)
       flash[:notice] = "Workshop pomyślnie zmodyfikowany"
      redirect_to(:action=>'index',  :category_id => @cats.id)
    else
      @counter = @asd.count
      @cat = Cat.order('position ASC')
      render('edit')
    end
  end
  
  def show
    @workshops = Workshop.find(params[:id])
  end
  
  def delete
  
    @workshops = Workshop.find(params[:id])
  end

  def destroy
    @workshops = Workshop.find(params[:id]).destroy
    flash[:notice] = "Workshop pomyślnie usunięty"
    redirect_to(:action=>'index', :category_id => @cats.id)
  end

  private

 def workshop_params
 	params.require(:workshops).permit(:name, :place, :date, :link, :position, :category_id, :text, :img, :file)
 end
 
  def parent_cat
    if params[:category_id]
      @cats = Cat.find(params[:category_id])
      @asd = Workshop.where(:category_id => (params[:category_id]))
    end
  end
end


