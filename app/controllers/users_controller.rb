class UsersController < ApplicationController

layout 'admin'
before_action :user_check
before_action :check_it, only: [:edit, :delete, :update]
before_action :find_id, only: [:edit, :delete, :update]

  def index
  	@user = User.sortuj
  end

  def new
  	@user = User.new({:user => "Login...", :position =>(User.count + 1)})
    @counter = User.count + 1
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Użytkownik #{@user.user} dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = User.all.count + 1
  		render('new')
  	end
  end

  def edit
    @counter = User.all.count
  end

    def update
    if @user.update_attributes(user_params)
       flash[:notice] = "Dane Użytkownika '#{@user.user}' pomyślnie zmodyfikowane"
      redirect_to(:action=>'index')
    else
      @counter = User.all.count
      render('edit')
    end
  end

  def delete

  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = "Konto Użytkownika '#{@user.user}' pomyślnie usunięte"
      redirect_to(:action=>'index')
  end


  private

 def user_params
 	params.require(:user).permit(:name, :surname, :user, :email, :position, :link, :text, :img, :password, :password_confirmation)
 end
 
  def find_id
    @user = User.find(params[:id])
  end
  
end
