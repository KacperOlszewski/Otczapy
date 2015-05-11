class PostsController < ApplicationController

layout 'admin'
before_action :user_check

  def index
  	@post = Post.sort
  end

  def new
  	@post = Post.new({:name => "Nazwa posta...", :teaser => "wprowadzenie", :position =>(Post.count + 1)})
    @counter = Post.count + 1
    @gallery = Gallery.order('position ASC')
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = "Post dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Post.all.count + 1
     @gallery = Gallery.order('position ASC')
  		render('new')
  	end
  end

  def edit
    @post = Post.find(params[:id])
    @gallery = Gallery.order('position ASC')
    @counter = Post.all.count
  end

    def update
      @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
       flash[:notice] = "Post pomyślnie zmodyfikowany"
      redirect_to(:action=>'show', :id => @post.id)
    else
      @counter = Post.all.count
      @gallery = Gallery.order('position ASC')
      render('edit')
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def delete
  
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:notice] = "Post pomyślnie usunięty"
    redirect_to(:action=>'index')
  end

  private

 def post_params
 	params.require(:post).permit(:name, :teaser, :link, :position, :text, :img, :file)
 end

end
