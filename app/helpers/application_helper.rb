module ApplicationHelper
  include Refinery::Copywriting::CopywritingHelper

  def output_term_associations()
    categories = Refinery::Documents::Category.where('depth = 0').order(:title)
    render partial: 'category', collection: categories, as: 'category'
  end

  def background_image(image, dimensions=nil)
    return unless image
    if dimensions
      image.thumbnail(dimensions).url
    else
      image.url
    end
  end

  def render_hidden_fields(except)
    params.except(except, :controller, :action, :id, :page, :utf8).collect do |key, value|
      if value.kind_of?(Array)
        value.collect do |v|
          hidden_field_tag "#{key}[]", v
        end
      else
        hidden_field_tag key, value
      end
    end.join("\n").html_safe
  end

end
