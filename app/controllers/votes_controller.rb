class VotesController < ApplicationController
  before_filter :cors

  def index

  end

  def new

  end

  def create
    vote = Vote.new(voter_id: 1, voted_on_id: params[:id])
    vote.opinion = "yes"
    vote.save
    User.first.votes << vote
    render json: vote.to_json
  end

end
