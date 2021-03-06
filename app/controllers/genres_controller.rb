class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = current_genre
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = current_genre
  end

  def update
    genre = current_genre
    genre.update(genre_params)
    redirect_to genre_path(params[:id])
  end

  private

  def current_genre
    Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
