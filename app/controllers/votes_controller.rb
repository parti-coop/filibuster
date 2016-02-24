class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @opinion = Opinion.find params[:opinion_id]
    @vote = @opinion.votes.build(vote_params)
    previous_vote = @opinion.voted_by current_user
    if previous_vote.present?
      @vote = previous_vote
      @vote.choice = params[:vote][:choice]
    else
      @vote.user = current_user
    end

    @vote.save
    redirect_to root_path
  end

  private

  def vote_params
    params.require(:vote).permit(:choice)
  end
end
