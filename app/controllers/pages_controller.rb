class PagesController < ApplicationController
  before_filter :load_manga
  before_filter :load_page, :only => [:show,:next,:previous,:edit,:update,:destroy]

  def show
    @first_page = first_page?
    @last_page = last_page?
    @translations = @page.translations.sort_by(&:pos)
    @translation = @page.translations.build
    @active = case params[:active].nil?
              when true
                case @translations.empty?
                  when true; Factory.build(:translation,:pos=>0)
                  when false; @translations.first
                end
              when false
                case params[:active] == "0"
                  when true; Factory.build(:translation,:pos=>0)
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
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to @manga, :notice => updated(:page)
    else
      render :edit
    end
  end
  
  def destroy
    @page.destroy
    redirect_to @manga
  end

  def previous
    redirect_to [@manga,@page] and return if first_page?
    redirect_to [@manga,prev_page]
  end
  def next
    redirect_to [@manga,@page] and return if last_page?
    redirect_to [@manga,next_page]
  end
  
  private

    def first_page?; page_index == 0 end
    def last_page?; page_index == page_no-1 end
  
    def load_manga; @manga = Manga.where(:slug => params[:manga_id]).first end
    def load_page; @page = @manga.pages.where(:slug => params[:id]).first end
    
    def new_page(diff)
      new_page_index = page_index+diff
      new_page_no = page_nos[new_page_index]
      @manga.pages.where(:no => new_page_no).first      
    end
    def next_page; new_page(+1) end
    def page_index; page_nos.index(@page.no) end
    def page_no; @manga.pages.count end
    def page_nos; @manga.pages.only(:no).asc(:no).map(&:no) end
    def prev_page; new_page(-1) end
end
