class SlidersController < ApplicationController

layout 'admin'
before_action :user_check, :admin_check

  def index
  	@slider = Slider.sort
  end

  def new
  	@slider = Slider.new({:name => "Tekst na slajdzie...", :position =>(Slider.count + 1)})
    @counter = Slider.count + 1
  end

  def create
  	@slider = Slider.new(slide_params)
  	if @slider.save
  		flash[:notice] = "Slajd dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Slider.all.count + 1
  		render('new')
  	end
  end

  def edit
    @slider = Slider.find(params[:id])
    @counter = Slider.all.count
  end

    def update
      @slider = Slider.find(params[:id])
    if @slider.update_attributes(slide_params)
       flash[:notice] = "Slajd pomyślnie zmodyfikowany"
      redirect_to(:action=>'show', :id => @slider.id)
    else
      @counter = Slider.all.count
      render('edit')
    end
  end
  
  def show
    @slider = Slider.find(params[:id])
  end
  
  def delete
  
    @slider = Slider.find(params[:id])
  end

  def destroy
    @slider = Slider.find(params[:id]).destroy
    flash[:notice] = "Slide pomyślnie usunięty"
    redirect_to(:action=>'index')
  end

  private

 def slide_params
 	params.require(:slider).permit(:name, :position, :text, :img)
 end

end

