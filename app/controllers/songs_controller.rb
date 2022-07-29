class SongsController < ApplicationController

  def index
    songs = Song.all
    render json: songs
  end

  def show
    song = Song.find_by(id:params[:id])
    render json: song
  end

  def create
    song = Song.new
    song.title = params[:title]
    song.album = params[:album]
    song.artist = params[:artist]
    song.year = params[:year]
    song.save
    render json: song 
  end

  def update
    song = Song.find_by(id:params[:id])
    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.save
    render json: song
  end

  def destroy
    song = Song.find_by(id:params[:id])
    song.destroy
    render json: {message: "Song has been deleted"}  
  end
end
