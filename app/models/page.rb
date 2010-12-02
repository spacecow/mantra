class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
  field :image_url
  slug :no
  referenced_in :manga
  embeds_many :translations
#  references_many :translations

  validates :manga, :presence => true
  validates :no, :presence => true, :uniqueness => { :scope => :manga_id }
end
