class OpinionsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index, :agree, :disagree]
  before_filter :authorize, except: [:show, :index, :agree, :disagree]
  def index
    @opinions = Opinion.all
    prepare_meta_tags title: "국민의 편지"
  end

  def new
    @opinion = Opinion.new
  end

  def edit
    @opinion = Opinion.find params[:id]
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.user = current_user
    if @opinion.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @opinion = Opinion.find params[:id]
    if @opinion.update_attributes(opinion_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @opinion = Opinion.find params[:id]
    @opinion.destroy
    redirect_to root_path
  end

  def show
    @opinion = Opinion.find params[:id]
    prepare_meta_tags title: @opinion.title, description: @opinion.body
  end

  def agree
    vote(:agree)
  end

  def disagree
    vote(:disagree)
  end

  private

  def vote(choice)
    cookie_voted_opinions = cookies[:voted_opinions_x]
    voted_opinions = {}
    if cookie_voted_opinions.present?
      voted_opinions = JSON.parse(cookie_voted_opinions)
    end

    @opinion = Opinion.find params[:id]
    unless voted_opinions.has_key?(params[:id])
      voted_opinions[params[:id]]= choice
      cookies[:voted_opinions_x] = JSON.generate(voted_opinions)
      @opinion.send("#{choice}_count=", (@opinion.send("#{choice}_count") + 1))
      @opinion.save
    end

    respond_to do |format|
      format.js
      format.html { redirect_to opinion_path(@opinion, anchor: 'comments')}
    end
  end

  def authorize
    unless current_user.try(:is_admin?)
      redirect_to root_path
    end
  end

  def opinion_params
    params.require(:opinion).permit(:title, :body)
  end
end
