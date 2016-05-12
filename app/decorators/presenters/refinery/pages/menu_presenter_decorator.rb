Refinery::Pages::MenuPresenter.class_eval do

  def menu_item_children(menu_item)
    if [4,6].include?(menu_item.original_id)
      if (menu_item.original_id == 4)
        items = document_menu_items(menu_item)
      else
        items = tool_menu_items(menu_item)
      end
    else
      items = within_max_depth?(menu_item) ? menu_item.children : []          
    end
    items
  end

  def document_menu_items(menu_item)
    items = []
    items << Refinery::MenuItem.new(menu_item.menu, { 
      url: context.refinery.documents_documents_path, 
      title: 'See all resources',
      menu_match: "^#{context.refinery.documents_documents_path}",
      original_type: 'Refinery::Page',
      original_id: 1
    })
    Refinery::Documents::Category.where('depth = 0').order('lft ASC').each do |t|
      items << Refinery::MenuItem.new(menu_item.menu, { 
        url: context.refinery.documents_category_path(t), 
        title: t.title, 
        menu_match: "^#{context.refinery.documents_category_path(t)}",
        original_type: 'Refinery::Documents::Category',
        original_id: t.id
      })
    end
    items
  end

  def tool_menu_items(menu_item)
    items = []
    Refinery::Tools::Tool.order(:title).each do |t|
      items << Refinery::MenuItem.new(menu_item.menu, { 
        url: context.refinery.tools_tool_path(t), 
        title: t.title, 
        menu_match: "^#{context.refinery.tools_tool_path(t)}",
        original_type: 'Refinery::Tools::Tool',
        original_id: t.id
      })
    end
    items
  end
     
end