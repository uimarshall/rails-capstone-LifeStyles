module CategoriesHelper
  def vote_button(article)
    vote = Vote.find_by(user: @current_user, article: article)

    if vote
      link_to('UnVote', article_vote_path(id: vote.id, article_id: article.id),
              method: :delete, class: 'btn btn-danger')
    else
      link_to('Vote', article_votes_path(article.id), remote: true, method: :post, class: 'btn btn-success')
    end
  end

  def category_article_title(article)
    article.title.truncate(27)
  end

  # @articles.collect(&:image).detect(&:attached?)
  def category_article_text(article)
    article.text.truncate(100, separator: ' ', omission: '.... (continued)')
  end

  def category_article_link(category)
    return unless category.articles.any?

    link_title = category.articles.pluck(:title).last.truncate(27)
    article = category.articles.last
    link_to(link_title, article_path(article), class: 'link-title underline')
  end
end
