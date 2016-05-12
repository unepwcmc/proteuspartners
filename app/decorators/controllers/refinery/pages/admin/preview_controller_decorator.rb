Refinery::Pages::Admin::PreviewController.class_eval do

  before_filter :find_tools
  before_filter :find_main_categories
  before_filter :find_partners
  before_filter :find_footer_links

  def find_tools
    @tools = Refinery::Tools::Tool.order('position ASC').limit(4)
  end

  def find_main_categories
    @main_categories = Refinery::Documents::Category.where("depth = 0")
  end

  def find_partners
    @partners = Refinery::Partners::Partner.order('position ASC')
  end

  def find_footer_links
    @footer_links = Refinery::Page.where('show_in_footer = true')
  end

end