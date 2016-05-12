class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_all_partners
  before_filter :footer_links
  before_filter :header
  before_filter :viewable_index, only: [:index]
  before_filter :viewable_object, only: [:show]
  before_filter :categories_side, only: [:show, :index, :home]

  def viewable_index
    # if @page.protected?
    #   store_location
    #   unless refinery_user_signed_in? || partner_signed_in?
    #     authenticate_partner!
    #   end
    # end
  end

  def viewable_object 
    obj = instance_variable_get("@#{controller_name.classify.downcase}")
    # binding.pry
    if obj.respond_to?(:protected?) && obj.protected?
      store_location
      unless refinery_user_signed_in? || partner_signed_in?  
        authenticate_partner!
      end
    end
  end

  def find_all_partners
    @partners = Refinery::Partners::Partner.where('show_in_footer = true').order('title ASC')
  end

  def footer_links
    @footer_links = Refinery::Page.where('show_in_footer = true')
  end

  def header
    @tools = Refinery::Tools::Tool.order('position ASC')
  end 

  def categories_side
    @categories_side = Refinery::Documents::Category.where("depth = 0").order('lft ASC').limit(6)
  end

end