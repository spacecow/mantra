# -*- coding: utf-8 -*-
class Notice
  include Mongoid::Document
  include Mongoid::Timestamps    
  field :message
  field :translation_id
  referenced_in :page

  validates :message, :presence => true
  validates :page, :presence => true
  validates :translation_id, :presence => true
  
  def english; message.split('♦')[1] end  
  def format_message_one; japanese end
  def format_message_two; english end
  def japanese; message.split('♦')[0] end
  def manga; page.manga end
  def manga_page_path; "#{manga_path}/#{page_path}" end
  def page_info; "#{page.manga_title}, page #{page.no.to_i }" end
  def translation; page.translations.find(translation_id) end
  def translation_pos; translation.pos end

  private
    def manga_path; "mangas/#{manga.slug}" end
    def page_path; "pages/#{page.slug}" end
end
