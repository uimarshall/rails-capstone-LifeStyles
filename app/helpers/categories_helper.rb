module CategoriesHelper
  def vote_button(article)
    vote = Vote.find_by(user: @current_user, article: article)

    if vote
      link_to('UnVote', article_vote_path(id: vote.id, article_id: article.id),
              method: :delete, class: 'btn btn-danger')
    else
      link_to('Vote', article_votes_path(article.id), method: :post, class: 'btn btn-success')
    end
  end

  def category_article_title(article)
    article.title.truncate(27)
  end

  def category_article_text(article)
    article.text.truncate(100, separator: ' ', omission: '.... (continued)')
  end

  def category_article_link(category)
    return unless category.articles.any?

    link_title = category.articles.pluck(:title).last.truncate(27)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'link-title underline')
  end

  def odd_article_image(index, article)
    article_image = ''

    article_image << content_tag(:div, '', class: 'article-img',
                                           style: "background-image: url(#{article.image.category_show.url}")

    article_image.html_safe if index.odd?
  end

  def even_article_image(index, article)
    article_image = ''

    article_image << content_tag(:div, '', class: 'article-img',
                                           style: "background-image: url(#{article.image.category_show.url}")

    article_image.html_safe if index.even?
  end
end
