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
    @manga.pages.where(:slug => params[:id]).first.destroy
    redirect_to @manga
  end

  # Could be optimized. Do not need to read in all contents of the pages,
  #just the page nos
  def previous
    redirect_to [@manga,page(params[:id])] and return if page_index(params[:id]) == 0
    redirect_to [@manga,prev_page(params[:id])]
  end
  def next
    redirect_to [@manga,page(params[:id])] and return if page_index(params[:id]) == page_no-1
    redirect_to [@manga,next_page(params[:id])]
  end
  
  private

    def load_manga; @manga = Manga.where(:slug => params[:manga_id]).first end
    def new_page(page_id,diff)
      new_page_index = page_index(page_id)+diff
      new_page_no = page_nos[new_page_index]
      @manga.pages.where(:no => new_page_no).first      
    end
    def next_page(page_id); new_page(page_id,+1) end
    def page(page_id); @manga.pages.where(:slug => page_id).first end
    def page_index(page_id); page_nos.index(page_id.to_i) end
    def page_no; @manga.pages.count end
    def page_nos; @manga.pages.asc(:no).map(&:no) end
    def prev_page(page_id); new_page(page_id,-1) end
end
