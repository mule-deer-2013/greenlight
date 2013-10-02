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

    if (params[:opinion] == "yes") && (Vote.where(voter_id: params[:voted_on_id], voted_on_id: params[:voter_id], opinion: "yes").count > 1)
        render json: "yes".to_json
      else
        render json: "no".to_json
    end
  end

end
