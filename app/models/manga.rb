class Manga
  include Mongoid::Document
  include Mongoid::Slug
  field :title
  slug :title
  attr_accessible :title

  validates :title, :presence => true, :uniqueness => true

  #  embeds_many :pages
  references_many :pages
end
