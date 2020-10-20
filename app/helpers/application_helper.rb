module ApplicationHelper
  def nav_items(categories)
    category_links = ''

    categories.each do |category|
      category_links << content_tag(:li, link_to(category.name.upcase, category_path(category),
                                                 class: 'nav-link'))
    end

    if @current_user
      category_links << content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path, class: 'nav-link'))
    end

    category_links.html_safe
  end
end
