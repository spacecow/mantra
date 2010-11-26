class PagesController < ApplicationController
  before_filter :load_manga

  def show
    @page = @manga.pages.where(:slug => params[:id]).first
    @translations = @page.translations.sort_by(&:pos)
    @translation = @page.translations.build
    @active = case params[:active].nil?
              when true
                case @translations.empty?
                  when true; Translation.new(:pos=>0,:x1=>100,:y1=>100,:x2=>100,:y2=>100)
                  when false; @translations.first
                end
              when false
                case params[:active] == "0"
                  when true; Translation.new(:pos=>0,:x1=>100,:y1=>100,:x2=>100,:y2=>100)
                  when false; @page.translations.where(:pos => params[:active].to_i).first
                end
              end
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
    @page.destroy
    @page = @manga.pages.where(:slug => params[:id]).first
    redirect_to @manga
  end

  # Could be optimized. Do not need to read in all contents of the pages,
  #just the page nos
  def previous
    @page = @manga.pages.where(:slug => params[:id]).first
    page_nos = @manga.pages.asc(:no).map(&:no)
    prev_page_index = page_nos.index(params[:id].to_i)-1
    prev_page_no = page_nos[prev_page_index]
    prev_page = @manga.pages.where(:no => prev_page_no).first
    redirect_to [@manga,prev_page]
  end
  
  private

    def load_manga
      @manga = Manga.where(:slug => params[:manga_id]).first      
    end
end
