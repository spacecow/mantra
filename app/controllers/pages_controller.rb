class PagesController < ApplicationController
  before_filter :load_manga

  def show
    @page = @manga.pages.where(:slug => params[:id]).first
    @translations = @page.translations.sort_by(&:pos)
    @active = params[:active].nil? ? 1 : params[:active].to_i
  end

  def new
    @page = @manga.pages.build
  end

  def create
    @page = @manga.pages.build(params[:page])
    if @page.save
      redirect_to @manga, :notice => created(:page)
    else
      render :new
    end
  end
  
  def edit
    @page = @manga.pages.where(:slug => params[:id]).first
  end

  def update
    @page = @manga.pages.where(:slug => params[:id]).first
    if @page.update_attributes(params[:page])
      redirect_to @manga, :notice => updated(:page)
    else
      render :edit
    end
  end
  
  def destroy
    @page = @manga.pages.where(:slug => params[:id]).first
    @page.destroy
    redirect_to @manga
  end

  private

    def load_manga
      @manga = Manga.where(:slug => params[:manga_id]).first      
    end
end
