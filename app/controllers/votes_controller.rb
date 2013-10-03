class VotesController < ApplicationController
  before_filter :cors

  def index

  end

  def new
    @vote = Vote.new
  end

  def create
    user = User.find(params[:voter_id])
    vote = Vote.create(voter_id: params[:voter_id], voted_on_id: params[:voted_on_id], opinion: params[:opinion])
    user.votes << vote
    match = Hash.new


    if ((params[:opinion] == "yes") && (Vote.where(voter_id: params[:voted_on_id], voted_on_id: params[:voter_id], opinion: "yes").count > 0))
        match[:status] = "yes"
        match[:votee] = User.find(params[:voted_on_id])
        render json: match.to_json
      else
        match[:status] = "no"
        p match
        render json: match.to_json

      end      


    end

  end


