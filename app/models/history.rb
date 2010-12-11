# -*- coding: utf-8 -*-
class History
  include Mongoid::Document
  field :message
  field :category_mask, :type => Integer
  
  embedded_in :translation, :inverse_of => :histories

  CATEGORIES = %w(New Edit Comment)

  def category
    CATEGORIES.reject{|r| ((category_mask || 0) & 2**CATEGORIES.index(r)).zero? }.first
  end
  def category=(s); self.category_mask = 2**CATEGORIES.index(s) end
  def english; message.split('♦')[1] end
  def format_message; "#{japanese} #{english}" end
  def japanese; message.split('♦')[0] end
  def to_s; "#{category}: #{format_message}" end
end
