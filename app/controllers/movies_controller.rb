class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    sort = params[:sort]
    case sort
    when 'title'
      ordering,@title_header = {:order => :title}, 'hilite'
    when 'release_date'
      ordering,@date_header = {:order => :release_date}, 'hilite'
    end
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}
    
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end
    @movies = Movie.find_all_by_rating(@selected_ratings.keys, ordering)

  end

  


  ####this is the new action leads to new view dir
  def dir
    @movies = Movie.where("director" => params[:movie_director])    
    #@movies = Movie.same_director_service(params[:movie_director])
    @notes = 'good'
    if params[:movie_director].nil?||params[:movie_director]==''
      #flash[:notice] = params[:movie_director]+" this is director"
      @notes = params[:movie_title]+" has no director"
    end
  end 


  def new
    # default: render 'new' template
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

end
