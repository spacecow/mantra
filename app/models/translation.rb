class Translation
  include Mongoid::Document
  include Mongoid::Slug  
  field :japanese
  field :english
#  field :page_id, :type => Integer
  field :pos, :type => Integer
  field :x1, :type => Integer, :default => 100
  field :y1, :type => Integer, :default => 100
  field :x2, :type => Integer, :default => 100
  field :y2, :type => Integer, :default => 100
  slug :pos
  embedded_in :page, :inverse_of => :translations
#  referenced_in :page

#  validates :pos, :presence => true, :uniqueness => {:scope => :page_id}
  
  def active; @active || false end
  def active=(b); @active = b end
  def classes(active,last)
    case active
    when 0
      last ? " inactive above-active" : " inactive"
    when pos
      ""
    when pos-1
      " inactive below-active"
    when pos+1
      " inactive above-active"
    else
      " inactive"
    end
  end
end
