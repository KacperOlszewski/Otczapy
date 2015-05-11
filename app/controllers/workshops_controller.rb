class WorkshopsController < ApplicationController
  
layout 'admin'
before_action :user_check

  def index
  	@workshop = Workshop.sort
  end

  def new
  	@workshop = Workshop.new({:name => "Nazwa Warsztatu...", :position =>(Workshop.count + 1)})
    @counter = Workshop.count + 1
    @gallery = Gallery.order('position ASC')
  end

  def create
  	@workshop = Workshop.new(workshop_params)
  	if @workshop.save
  		flash[:notice] = "Workshop dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Workshop.all.count + 1
     @gallery = Gallery.order('position ASC')
  		render('new')
  	end
  end

  def edit
    @workshop = Workshop.find(params[:id])
    @gallery = Gallery.order('position ASC')
    @counter = Workshop.all.count
  end

    def update
      @workshop = Workshop.find(params[:id])
    if @workshop.update_attributes(workshop_params)
       flash[:notice] = "Workshop pomyślnie zmodyfikowany"
      redirect_to(:action=>'show', :id => @workshop.id)
    else
      @counter = Workshop.all.count
      @gallery = Gallery.order('position ASC')
      render('edit')
    end
  end
  
  def show
    @workshop = Workshop.find(params[:id])
  end
  
  def delete
  
    @workshop = Workshop.find(params[:id])
  end

  def destroy
    @workshop = Workshop.find(params[:id]).destroy
    flash[:notice] = "Workshop pomyślnie usunięty"
    redirect_to(:action=>'index')
  end

  private

 def workshop_params
 	params.require(:workshop).permit(:name, :place, :date, :link, :position, :text, :img, :file)
 end

end
