module ArticlesHelper
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      "<notextile>#{CodeRay.scan($3, $2).div(:css => :class)}</notextile>"
    end
  end
end
