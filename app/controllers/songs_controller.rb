require 'pry'

class SongsController < ApplicationController

  def index
    @song = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(genre_params)
    @song.save
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @genre.update(song_params)
    redirect_to song_path(@song)
  end

  def genre_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
