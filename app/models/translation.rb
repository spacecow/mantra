class Translation
  include Mongoid::Document
  include Mongoid::Slug  
  field :japanese
  field :english
  field :page_id, :type => Integer
  field :pos, :type => Integer
  slug :pos
  referenced_in :page

  validates :pos, :presence => true, :uniqueness => true
  
  def active; @active || false end
  def active=(b); p b; @active = b end
  def classes(active)
    case active
    when pos
      ""
    when pos-1
      " non-active below-active"
    when pos+1
      " non-active above-active"
    else
      " non-active"
    end
  end
end
