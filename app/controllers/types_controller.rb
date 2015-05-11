class TypesController < ApplicationController

layout 'admin'
before_action :user_check, :admin_check

  def index

    @type = Type.sort

  end

  def show
    @type = Type.find(params[:id])

  end

  def new

    @type = Type.new({:name=>"uzupełnij", :position =>(Type.count + 1)})
    @counter = Type.count + 1
  end

  def create
  
    @type = Type.new(type_params)
    if @type.save 
      redirect_to(:action => "index")
      flash[:notice] = 'Pomyślnie utworzono!'
    else
      @counter = Type.count + 1
      render('new')
    end
  end  

  def edit
    @type = Type.find(params[:id])
    @counter = Type.count
  end

  def update  
        @type = Type.find(params[:id])
          if @type.update_attributes(type_params) 
          redirect_to(:action => "index")
         flash[:notice] = 'Pomyślnie zaktualizowano!'
         else
          @counter = Type.count
          render('edit')
        end
  end

  def delete
     @type = Type.find(params[:id])
  end


  def destroy
  
    type = Type.find(params[:id]).destroy
    flash[:notice] = 'Pomyślnie usunięto!'
    redirect_to(:action => "index") 
  end

private
    def type_params
      params.require(:type).permit(:name, :position, :created_at)
    end

end
