class VotesController < ApplicationController
  before_filter :cors

  def index

  end

  def new

  end

  def create
    user = User.find(params[:voter_id])
    vote = Vote.create(voter_id: params[:voter_id], voted_on_id: params[:voted_on_id], opinion: params[:opinion])
    user.votes << vote

    # User.find(richie.id).votes.where(voted_on_id: dude.id).first.opinion == User.find(dude.id).votes.where(voted_on_id: richie.id).first.opinion
  
    render json: vote.to_json
  end

end
