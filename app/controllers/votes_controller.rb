class VotesController < ApplicationController
  before_filter :cors

  def index

  end

  def new
    @vote = Vote.new
  end

  def create
    user = User.find(params[:vote][:voter_id])
    vote = Vote.create(voter_id: params[:vote][:voter_id], voted_on_id: params[:vote][:voted_on_id], opinion: params[:vote][:opinion])
    user.votes << vote
<<<<<<< HEAD
    
    # User.find(richie.id).votes.where(voted_on_id: dude.id).first.opinion == User.find(dude.id).votes.where(voted_on_id: richie.id).first.opinion
  
    render json: vote.to_json
=======

    if (params[:vote][:opinion] == "yes") && (Vote.where(voter_id: params[:vote][:voted_on_id], voted_on_id: params[:vote][:voter_id], opinion: "yes").count > 1)
        render json: "yes".to_json
      else 
        render json: "no".to_json
    end      
>>>>>>> master
  end
    
end
