class Translation
  include Mongoid::Document
  include Mongoid::Slug  
  field :japanese
  field :english
  field :page_id, :type => Integer
  field :pos, :type => Integer
  slug :pos
  referenced_in :page

  validates :english, :presence => true
  validates :pos, :presence => true, :uniqueness => {:scope => :page_id}
  validates :page_id, :presence => true
  
  def active; @active || false end
  def active=(b); @active = b end
  def classes(active,last)
    case active
    when pos
      ""
    when pos-1
      " non-active below-active"
    when pos+1
      " non-active above-active"
    when nil
      last ? " non-active above-active" : " non-active"
    else
      " non-active"
    end
  end
end
