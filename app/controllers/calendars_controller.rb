class CalendarsController < ApplicationController

layout 'admin'
before_action :user_check, :admin_check

  def index
  	@calendar = Calendar.sort
  end

  def new
  	@calendar = Calendar.new({:name => "Nazwa dźwięku...", :position =>(Calendar.count + 1)})
    @counter = Calendar.count + 1
  end

  def create
  	@calendar = Calendar.new(calendar_params)
  	if @calendar.save
  		flash[:notice] = "Dźwięk dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Calendar.all.count + 1
  		render('new')
  	end
  end

  def edit
    @calendar = Calendar.find(params[:id])
    @counter = Calendar.all.count
  end

    def update
      @calendar = Calendar.find(params[:id])
    if @calendar.update_attributes(calendar_params)
       flash[:notice] = "Dźwięk zmodyfikowany"
      redirect_to(:action=>'index')
    else
      @counter = Calendar.all.count
      render('edit')
    end
  end
  
  def show
    @calendar = Calendar.find(params[:id])
  end
  
  def delete
  
    @calendar = Calendar.find(params[:id])
  end

  def destroy
    @calendar = Calendar.find(params[:id]).destroy
    flash[:notice] = "Dźwięk pomyślnie usunięty"
      redirect_to(:action=>'index')
  end

  private

 def calendar_params
 	params.require(:calendar).permit(:name, :position, :link)
 end

end
