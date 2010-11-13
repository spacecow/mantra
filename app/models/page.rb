class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
  slug :no
  referenced_in :manga
  references_many :translations
  
  validates :no, :presence => true, :uniqueness => true
end
