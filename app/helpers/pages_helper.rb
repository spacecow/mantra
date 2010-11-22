module PagesHelper
  def translation_form_classes(translations_size)
    classes = []
    classes << 'non-active' if translations_size > 0
    classes << 'below-active' if translations_size ==1    
    classes.split.join(' ')    
  end
end
