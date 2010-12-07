class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
#  field :image_url
  mount_uploader :image, ImageUploader #400 645
  slug :no
  referenced_in :manga
  embeds_many :translations
  references_many :notices
  #  references_many :translations

  validates :manga, :presence => true
  validates :no, :presence => true, :uniqueness => { :scope => :manga_id }

  def manga_title; manga.title end
end
