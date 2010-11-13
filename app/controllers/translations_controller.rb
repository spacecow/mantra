class TranslationsController < ApplicationController
  before_filter :load_manga_and_page

  def move_down
    upper_translation = @page.translations.where(:slug => params[:id]).first
    lower_translation = @page.translations.where(:slug => params[:id].to_i+1).first
    swap_positions(upper_translation,lower_translation)
    redirect_to [@manga,@page]
  end

  def move_up
    upper_translation = @page.translations.where(:slug => params[:id].to_i-1).first
    lower_translation = @page.translations.where(:slug => params[:id]).first
    swap_positions(upper_translation,lower_translation)
    redirect_to [@manga,@page]
  end

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
