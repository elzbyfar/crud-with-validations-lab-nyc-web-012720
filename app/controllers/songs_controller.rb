class SongsController < ApplicationController

    before_action :set_song, only: [:edit, :update, :show, :destroy]

    def index 
        @songs = Song.all 
        render :index
    end 

    def show 
    end 

    def new 
        @song = Song.new 
    end 

    def create 
        @song = Song.create(song_params)
        if @song.valid?
            redirect_to @song 
        else
            flash[:errors] = @song.errors.full_messages
            render :new
        end 
    end 

    def edit 
    end 

    def update 
        @song.update(song_params)
        if @song.valid?
            redirect_to @song 
        else 
            flash[:errors] = @song.errors.full_messages 
            render :edit
        end 

    end

    def destroy 
        @song.destroy 
        redirect_to songs_path
    end 

    private 

    def song_params 
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

    def set_song 
        @song = Song.find(params[:id])
    end 

end
