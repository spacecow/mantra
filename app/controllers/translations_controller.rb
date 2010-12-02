class TranslationsController < ApplicationController
  before_filter :load_manga_and_page

  def create
    pos = @page.translations.count+1
    @translation = @page.translations.build(params[:translation].merge(:pos=>pos))
    if @translation.save
      redirect_to manga_page_path(@manga,@page,:active=>pos)
    else
      @first_page = first_page?
      @last_page = last_page?
      @translations = []
      @translations = @page.translations.reject{|e|e==@translation}.sort_by(&:pos)
      @active = Translation.new(:pos=>0,
                                :x1=>params[:translation][:x1],
                                :y1=>params[:translation][:y1],
                                :x2=>params[:translation][:x2],
                                :y2=>params[:translation][:y2])
      render 'pages/show'
    end
  end
  
  def edit
    @translations = @page.translations.sort_by(&:pos)
    @translation = @page.translations.where(:slug => params[:id]).first
    @active = @translation
  end

  def update
    @translation = @page.translations.where(:slug => params[:id]).first
    if params[:commit] == "Cancel"
      redirect_to manga_page_path(@manga,@page, :active => @translation.pos) and return
    end
    if @translation.update_attributes(params[:translation])
      redirect_to manga_page_path(@manga,@page, :active => @translation.pos)
    else
      @translations = @page.translations.sort_by(&:pos)
      @active = @translation
      render :edit
    end
  end
  
  def destroy
    @page.translations.where(:slug => params[:id]).first.destroy
    redirect_to [@manga,@page]
  end

  def move(upper,active=upper)
    upper_translation = @page.translations.where(:pos => upper).first
    lower_translation = @page.translations.where(:pos => upper+1).first
    swap_positions(upper_translation,lower_translation)
    redirect_to manga_page_path(@manga,@page,:active=>active)
  end
  def move_down; move(params[:id].split('-')[0].to_i,params[:id].split('-')[0].to_i+1) end
  def move_up; move(params[:id].split('-')[0].to_i-1) end
  
  private

    def load_manga_and_page
      @manga = Manga.where(:slug => params[:manga_id]).first
      @page = @manga.pages.where(:slug => params[:page_id]).first
    end

    def swap_positions(upper_translation,lower_translation)
      upper_translation.update_attributes(:pos=>0)
      lower_translation.update_attributes(:pos=>lower_translation.pos-1)
      upper_translation.update_attributes(:pos=>lower_translation.pos+1)
    end
end
