class Page
  include Mongoid::Document
  include Mongoid::Slug
  field :no, :type => Integer
  field :image_url
  mount_uploader :image, ImageUploader
  slug :no
  referenced_in :manga
  embeds_many :translations
#  references_many :translations

  validates :manga, :presence => true
  validates :no, :presence => true, :uniqueness => { :scope => :manga_id }

  def image
    @image ||= UrlUpload.new(image_url)
    File.new(@image)
  end
end
