class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :load_notices

  def created(s); success(:created,s) end
  def deleted(s); success(:deleted,s) end
  def d(s); t(s).downcase end
  def success(action,mdl); t("success.#{action}",:obj=>d(mdl)) end
  def updated(s); success(:updated,s) end

  private

    def after_sign_out_path_for(resource_or_scope); mangas_path end
    def first_page?; page_index == 0 end
    def last_page?; page_index == page_no-1 end
    def load_notices; @notices = Notice.all end
    def page_index; page_nos.index(@page.no) end
    def page_no; @manga.pages.count end    
    def page_nos; @manga.pages.only(:no).asc(:no).map(&:no) end
end
