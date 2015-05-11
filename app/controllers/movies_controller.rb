class MoviesController < ApplicationController

layout 'admin'
before_action :user_check, :admin_check

  def index
  	@movie = Movie.sort
  end

  def new
  	@movie = Movie.new({:name => "Nazwa filmu...", :position =>(Movie.count + 1)})
    @counter = Movie.count + 1
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		flash[:notice] = "Film dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Movie.all.count + 1
  		render('new')
  	end
  end

  def edit
    @movie = Movie.find(params[:id])
    @counter = Movie.all.count
  end

    def update
      @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
       flash[:notice] = "Film pomyślnie zmodyfikowany"
      redirect_to(:action=>'index')
    else
      @counter = Movie.all.count
      render('edit')
    end
  end
  
  def delete
  
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
    flash[:notice] = "Film pomyślnie usunięty"
    redirect_to(:action=>'index')
  end

  private

 def movie_params
 	params.require(:movie).permit(:name, :position, :link)
 end

end

