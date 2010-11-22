class TranslationsController < ApplicationController
  before_filter :load_manga_and_page

  def create
    pos = @page.translations.count+1
    @translation = @page.translations.build(params[:translation].merge(:pos=>pos))
    if @translation.save
      redirect_to manga_page_path(@manga,@page,:active=>pos)
    else
      @translations = @page.translations.sort_by(&:pos)
      render 'pages/show'
    end
  end
  
  def move(upper,active=upper)
    upper_translation = @page.translations.where(:slug => upper).first
    lower_translation = @page.translations.where(:slug => upper+1).first
    swap_positions(upper_translation,lower_translation)
    redirect_to manga_page_path(@manga,@page,:active=>active)
  end
  def move_down; move(params[:id].to_i,params[:id].to_i+1) end
  def move_up; move(params[:id].to_i-1) end
  
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
