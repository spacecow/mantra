class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :load_notices

  def created(s); success(:created,s) end
  def deleted(s); success(:deleted,s) end
  def d(s); t(s).downcase end
  def success(action,mdl); t("success.#{action}",:obj=>d(mdl)) end
  def updated(s); success(:updated,s) end

  private

    def load_notices; @notices = Notice.all end

    def after_sign_out_path_for(resource_or_scope); mangas_path end
end
