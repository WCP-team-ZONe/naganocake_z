class Private::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの新規登録が完了しました。"
      redirect_to private_genres_path
    else
      @genre = Genre.all
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの編集が完了しました。"
      redirect_to private_genres_path
    else
      render "edit"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
