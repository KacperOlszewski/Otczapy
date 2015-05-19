class CatsController < ApplicationController


layout 'admin'
before_action :user_check, :admin_check

  def index

    @category = Cat.sort

  end

  def show
    @category = Cat.find(params[:id])

  end

  def new

    @category = Cat.new({:name=>"uzupełnij", :position =>(Cat.count + 1)})
    @counter = Cat.count + 1
  end

  def create
  
    @category = Cat.new(cat_params)
    if @category.save 
      redirect_to(:action => "index")
      flash[:notice] = 'Pomyślnie utworzono!'
    else
      @counter = Cat.count + 1
      render('new')
    end
  end  

  def edit
    @category = Cat.find(params[:id])
    @counter = Cat.count
  end

  def update  
        @category = Cat.find(params[:id])
          if @category.update_attributes(cat_params) 
          redirect_to(:action => "index")
         flash[:notice] = 'Pomyślnie zaktualizowano!'
         else
          @counter = Cat.count
          render('edit')
        end
  end

  def delete
     @category = Cat.find(params[:id])
  end


  def destroy
  
    cat = Cat.find(params[:id]).destroy
    flash[:notice] = 'Pomyślnie usunięto!'
    redirect_to(:action => "index") 
  end

private
    def cat_params
      params.require(:category).permit(:name, :position, :created_at)
    end

end
