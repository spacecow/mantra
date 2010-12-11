class Manga
  include Mongoid::Document
  include Mongoid::Slug
  field :title
  slug :title
  attr_accessible :title

  validates :title, :presence => true, :uniqueness => true

  references_many :pages, :dependent => :destroy

  def self.search(search)
    if search
      where(:title => /#{search}/i)
    else
      all
    end
  end
end
