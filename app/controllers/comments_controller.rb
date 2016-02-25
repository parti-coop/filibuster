class CommentsController < ApplicationController
  def create
    @opinion = Opinion.find params[:opinion_id]
    @comment = @opinion.comments.build(comment_params)
    if !@comment.save
      redirect_to @opinion, flash: { error: "이름과 내용을 입력해 주세요" }
    else
      redirect_to @opinion
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :email, :name)
  end

end
