module ApplicationHelper
  def add_d(s);  end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def create(s); t2(:create,s) end
  def d(s); t(s).downcase end
  def dp(s); d(s).pluralize end
  def edit(s); t2(:edit,s) end
  def lbl(s); chain(:label,s) end
  def list_dp(s); tdp2(:list,s) end
  def new(s); t2(:new,s) end
  def new_d(s); td2(:new,s) end
  def pl(s); t(s).pluralize end
  def show(s); t2(:show,s) end
  def sure?; t('message.sure?') end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end
  def td2(s1,s2); t(lbl(s1), :obj => d(s2)) end
  def tdp2(s1,s2); t(lbl(s1), :obj => dp(s2)) end
  def title(page_title)
    content_for(:title){page_title}
  end
  def tp2(s1,s2); t(lbl(s1), :obj => pl(s2)) end
end
