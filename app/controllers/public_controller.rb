class PublicController < ApplicationController
  
layout :resolve_layout
  
  def intro
  end

  def index
    @post = Post.sort.paginate(:page => params[:page], :per_page => 6)
    @slider = Slider.order('position DESC')
    @slider_size = Slider.count
    @workshop = Workshop.sort
    @gallery = Gallery.where(:type_id => 1).order('position DESC')[0..-2]
    @movies = Movie.sort 
    @sound = Calendar.sort
    @users = User.sortuj[0..-2]
  end

  def about
  end

  def offer
  end 

  def contact_form
      name = params[:name]
      email = params[:email]
      body = params[:comments]

      UserEmail.email(name, email, body).deliver
  		flash[:notice] = "Wiadomość wysłano - Dziękujemy!"
  		redirect_to(:controller => 'public')
  end


  def photos 
    @photo = Gallery.find(params[:gallery_id])
  end

  def contact
  end
  
  
private

  def resolve_layout
    case action_name

    when "intro"
      'intro'
    when "index"
      'public_front'
    else
      'public'
    end
  end
end
