class Article
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps  
  field :title
  field :body
  slug :title
  
  validates :title, :uniqueness => true, :presence => true
end
