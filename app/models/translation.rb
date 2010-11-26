class Translation
  include Mongoid::Document
  include Mongoid::Slug  
  field :japanese
  field :english
  field :page_id, :type => Integer
  field :pos, :type => Integer
  field :x1, :type => Integer
  field :y1, :type => Integer
  field :x2, :type => Integer
  field :y2, :type => Integer
  slug :pos
  referenced_in :page

  validates :english, :presence => true
  validates :pos, :presence => true, :uniqueness => {:scope => :page_id}
  validates :page_id, :presence => true
  
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
