class Notice
  include Mongoid::Document
  include Mongoid::Timestamps    
  field :message
  field :translation_id
  referenced_in :page

  def manga; page.manga end
  def page_info; "#{page.manga_title}, page #{page.no.to_i }" end
  def translation; page.translations.find(translation_id) end
  def translation_pos; translation.pos end
end
