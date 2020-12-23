class Api::V1::CampaignsController < ApplicationController
  # GET /api/v1/campaigns
  def index
    @campaigns = Campaign.order(created_at: :desc)
    render "campaigns/index.json.jbuilder"
  end

  # GET /api/v1/campaigns/:id
  def show
    if params[:include].nil?
      @campaign = Campaign.find(params[:id])
    end
    render "campaigns/show.json.jbuilder", status: :ok
  end

  # GET /api/v1/campaigns/:id/activities
  def activity
  end

  # GET /api/v1/campaigns/:id/groups
  def groups
  end

  # POST /api/v1/campaigns
  def create
  end

  # PUT/PATCH /api/v1/campaigns/:id
  def update
  end

  # DELETE /api/v1/campaigns/:id
  def destroy
  end
end
