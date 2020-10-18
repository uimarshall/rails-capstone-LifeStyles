class VotesController < ApplicationController
  before_action :current_user

  def create
    @article = Article.find_by(id: params[:article_id])
    if @current_user.votes.exists?(article_id: params[:article_id])
      flash[:alert] = 'You have already voted for this article!'
    else
      params[:vote][:user_id] = current_user.id
      # @vote = @current_user.votes.new(article_id: params[:article_id])

      # if @vote.save
      #   # redirect_to :back, notice: 'You voted for an article'
      #   redirect_to @article, notice: 'You voted for an article'
      #   # render @article
      # else
      #   redirect_to request.referrer, alert: 'You unvoted an article'
      # end
      @vote = Vote.new(vote_params)
      if @vote.save
        flash[:success] = 'Thanks for voting!'
      else
        flash[:alert] = @vote.errors.full_messages.join(', ')
      end

    end
  end

  def destroy
    # @vote = Vote.find_by(id: params[:id], user: @current_user, article_id: params[:article_id])
    @vote = current_user.votes.find(params[:id])

    if @vote.destroy
      redirect_to request.referrer, notice: 'You unvoted an article'
    else
      redirect_to request.referrer, alert: 'Cannot unvote without voting first!'
    end
  end

  def vote_params
    params.require(:vote).permit(:value, :user_id, :reference_id, :reference_type)
  end
end
