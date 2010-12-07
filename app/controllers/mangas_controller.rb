class MangasController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def show
    @manga = Manga.where(:slug => params[:id]).first
    @pages = @manga.pages.asc(:no)
  end
  
  def index
    @mangas = Manga.search(params[:search]).paginate(:per_page => 15, :page => params[:page])
    @article = Article.last
    @notice = Notice.last
    @translation = @notice.translation unless @notice.nil?
  end

  def new
    @manga = Manga.new
  end

  def create
    redirect_to mangas_path and return if params[:commit] == "Cancel"
    @manga = Manga.create(params[:manga])
    if @manga.save
      redirect_to mangas_path, :notice => created(:manga)
    else
      render :new
    end
  end

  def edit
    @manga = Manga.where(:slug => params[:id]).first
  end

  def update
    @manga = Manga.where(:slug => params[:id]).first
    if @manga.update_attributes(params[:manga])
      redirect_to @manga, :notice => updated(:manga)
    else
      render :edit
    end
  end

  def destroy
    @manga = Manga.where(:slug => params[:id]).first
    @manga.destroy
    
    redirect_to mangas_path
  end
end
