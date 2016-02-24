class CommentsController < ApplicationController
  def create
    @opinion = Opinion.find params[:opinion_id]
    @comment = @opinion.comments.build(comment_params)
    @comment.save

    redirect_to @opinion
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :email, :name)
  end

end
