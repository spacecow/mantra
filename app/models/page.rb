class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
  mount_uploader :image, ImageUploader #field is avatar_filename
  slug :no
  referenced_in :manga
  embeds_many :translations
#  references_many :translations

  validates :manga, :presence => true
  validates :no, :presence => true, :uniqueness => { :scope => :manga_id }
end
