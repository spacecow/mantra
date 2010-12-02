class Article
  include Mongoid::Document
  include Mongoid::Slug
  field :title
  field :body
  slug :title

  validates :title, :uniqueness => true, :presence => true
end
