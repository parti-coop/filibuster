class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @opinion = Opinion.find params[:opinion_id]
    @comment = @opinion.comments.build(comment_params)
    @comment.user = current_user
    set_choice
    @comment.save

    redirect_to @opinion
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update_attributes(comment_params)
    set_choice
    redirect_to @opinion
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.opinion
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_choice
    @vote = @comment.opinion.voted_by current_user
    @comment.choice = @vote.try(:choice)
  end
end
