class VotesController < ApplicationController
  before_filter :cors

  def index

  end

  def new

  end

  def create
    p params

    vote = Vote.new(voter_id: 1, voted_on_id: params[:id])
    vote.opinion = "yes"
    vote.save
    current_user.votes << vote
  end

end