class MoviesController < ApplicationController
  
  
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.new
  end

  def new
    @movie = Movie.new(movie_params)
  end

  def create
    @movies = Movie.new(movie_params)
    if @movie.save
    redirect_to(movie_path)
    else
    render(:new)
    end 
  end

  def update   
    @movie = Movie.find(params[:id])
    if @movie.update(moive_params)
      redirect_to(movie_path)
    else
      render(:edit)
  end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to(movies_path)
  end

  
  private

  def movie_params
    params.require(:movie).permit(:body)
  end 

  end

