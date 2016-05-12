Refinery::PagesController.class_eval do

  def home
    @categories = Refinery::Documents::Category.where("depth = 0").order('lft ASC').limit(6)
    @recent = Refinery::Documents::Document.recent_updated(10)
    @tools = Refinery::Tools::Tool.order('position ASC').limit(4)
  end

  def show
    @tools = Refinery::Tools::Tool.order('position ASC')
  end

end