class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!
    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
        redirect_to admin_genres_path
        # 上記のままではリダイレクトエラーが起こってしまう
        else
        render :new
        end
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to admin_genres_path
    end

    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy
        redirect_to admin_genres_path
    end

    def index
        @genres = Genre.page(params[:page])
    end

    private
        def genre_params
            params.require(:genre).permit(:is_active)
        end
    end
