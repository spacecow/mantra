class Article
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps  
  field :title
  field :body
  slug :title
  
  validates :title, :uniqueness => true, :presence => true

  def published_date
    "#{month} #{date}, #{year}"
  end

  private

    def date; day_no.to_s+suffix end
    def day_no; created_at.strftime("%d").to_i end 
    def month; created_at.strftime("%B") end
    def suffix
      case day_no%10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else "th"
      end
    end
    def year; created_at.strftime("%Y") end
end
