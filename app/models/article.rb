class Article
  include Mongoid::Document
  include Mongoid::Slug
  field :title
  field :body
  slug :body
  
  validates :title, :uniqueness => true, :presence => true
end
