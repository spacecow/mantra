class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
  mount_uploader :image, ImageUploader #field is avatar_filename
  slug :no
  referenced_in :manga
  references_many :translations
  
  validates :no, :presence => true, :uniqueness => { :scope => :manga_id }
end
