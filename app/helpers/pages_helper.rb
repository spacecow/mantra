module PagesHelper
  def translation_form_classes
    classes = []
    if @translation.new_record? && @active != 0
      classes << 'inactive'
      classes << 'below-active' if @active == @translations.size    
    end
    classes.split.join(' ')
  end

  def bottom_translation_fillout_classes
    classes = ["inactive"]
    classes << 'below-active' if @active==0 || (!@translation.new_record? && @translations.size == @active)
    classes.split.join(" ")
  end

  def top_translation_fillout_classes
    classes = ["inactive"]
    classes << "above-active" if @active==1 || (@translations.size==0 && @active==0)
    classes.split.join(" ")    
  end
end
